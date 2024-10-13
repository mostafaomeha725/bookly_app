import 'package:booklyapp1/Feature/splash/presentation/Manger/SimilarBooksCubit/similar_books_cubit.dart';
import 'package:booklyapp1/Feature/splash/presentation/Views/widgets/clipimage.dart';
import 'package:booklyapp1/core/Router/goRouter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ListViewRelevance extends StatelessWidget {
  const ListViewRelevance({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(
                            AppRouter.kFeatureView,
                            extra: state.books[index],
                          );
                        },
                        child: ClipImage(
                          imageurl: state.books[index].volumeInfo.imageLinks
                                  ?.thumbnail ??
                              "",
                        ),
                      )),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
