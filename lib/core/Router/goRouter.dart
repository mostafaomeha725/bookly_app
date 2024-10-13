import 'package:booklyapp1/Feature/splash/presentation/Manger/SearchBookCubit/search_book_cubit.dart';
import 'package:booklyapp1/Feature/splash/presentation/Manger/ServerLocated/ServerLocated.dart';
import 'package:booklyapp1/Feature/splash/presentation/Manger/SimilarBooksCubit/similar_books_cubit.dart';
import 'package:booklyapp1/Feature/splash/presentation/Views/FeatureView.dart';
import 'package:booklyapp1/Feature/splash/presentation/Views/SearchBookView.dart';
import 'package:booklyapp1/Feature/splash/presentation/Views/SplashView.dart';
import 'package:booklyapp1/Feature/splash/presentation/Views/homeView.dart';
import 'package:booklyapp1/Home/models/book_model/book_model.dart';
import 'package:booklyapp1/core/home/repo/homerepoImpl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static String kFeatureView = '/FeatureView';
  static const kHomeView = '/HomeView';
  static const kSearchView = '/SearchBookView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: kFeatureView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepoImpl>(),
          ),
          child: FeatureView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => SearchBookCubit(
              getIt.get<HomeRepoImpl>(),
            ),
            child: SearchBookView(
                // bookModel: state.extra as BookModel,
                ),
          );
        },
      ),
    ],
  );
}
