import 'package:booklyapp1/Feature/splash/presentation/Manger/FeatureBookCubit/feature_book_cubit.dart';
import 'package:booklyapp1/Feature/splash/presentation/Views/widgets/FailureWidget.dart';
import 'package:booklyapp1/Feature/splash/presentation/Views/widgets/clipimage.dart';
import 'package:booklyapp1/core/Router/goRouter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ListViewFeatureBook extends StatelessWidget {
  const ListViewFeatureBook({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBookCubit, FeatureBookState>(
      builder: (context, state) {
        if (state is FeatureBookSuccess) {
          return ListView.builder(
            itemCount: state.books.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(
                    AppRouter.kFeatureView,
                    extra: state.books[index],
                  );
                },
                child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ClipImage(
                      imageurl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                              "",
                    )),
              );
            },
          );
        } else if (state is FeatureBookFailure) {
          return const FailureWidget();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
