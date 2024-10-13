import 'package:booklyapp1/Feature/splash/presentation/Manger/NewestBookCubit/newest_book_cubit.dart';
import 'package:booklyapp1/Feature/splash/presentation/Views/widgets/RateCard.dart';
import 'package:booklyapp1/Home/models/book_model/book_model.dart';
import 'package:booklyapp1/core/Router/goRouter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CardBook extends StatelessWidget {
  const CardBook({
    super.key,
    this.bookModel,
  });
  final List<BookModel>? bookModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBookCubit, NewestBookState>(
      builder: (context, state) {
        if (state is NewestBookSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: bookModel?.length ?? state.books.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(
                    AppRouter.kFeatureView,
                    extra: bookModel?[index] ?? state.books[index],
                  );
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CachedNetworkImage(
                          height: 135,
                          width: 100,
                          fit: BoxFit.fill,
                          imageUrl: bookModel?[index]
                                  .volumeInfo
                                  .imageLinks
                                  ?.thumbnail ??
                              state.books[index].volumeInfo.imageLinks
                                  ?.thumbnail ??
                              "",
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .5,
                            child: Text(
                              bookModel?[index].volumeInfo.title ??
                                  state.books[index].volumeInfo.title ??
                                  "",
                              style: const TextStyle(fontSize: 22),
                              textDirection: TextDirection.ltr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            bookModel?[index].volumeInfo.authors?[0] ??
                                state.books[index].volumeInfo.authors?[0] ??
                                "",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white.withOpacity(0.7)),
                          ),
                          RateCard(
                              rating: bookModel?[index]
                                      .volumeInfo
                                      .averageRating ??
                                  state.books[index].volumeInfo.averageRating ??
                                  0,
                              count: bookModel?[index]
                                      .volumeInfo
                                      .ratingsCount ??
                                  state.books[index].volumeInfo.ratingsCount ??
                                  500)
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        } else if (state is NewestBookFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
