import 'package:booklyapp1/Feature/splash/presentation/Manger/FeatureBookCubit/feature_book_cubit.dart';
import 'package:booklyapp1/Feature/splash/presentation/Manger/NewestBookCubit/newest_book_cubit.dart';
import 'package:booklyapp1/Feature/splash/presentation/Manger/ServerLocated/ServerLocated.dart';
import 'package:booklyapp1/core/BlocObserve/Simple_Bloc_Observe.dart';
import 'package:booklyapp1/core/Router/goRouter.dart';
import 'package:booklyapp1/core/home/repo/homerepoImpl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setup();
  Bloc.observer = SimpleBlocObserve();
  runApp(const Booklyapp1());
}

class Booklyapp1 extends StatelessWidget {
  const Booklyapp1({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FeatureBookCubit>(
          create: (context) =>
              FeatureBookCubit(getIt.get<HomeRepoImpl>())..fetchFeatureBook(),
        ),
        BlocProvider<NewestBookCubit>(
          create: (context) =>
              NewestBookCubit(getIt.get<HomeRepoImpl>())..fetchNewestBook(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: const Color(0xff100B20),
            textTheme: const TextTheme(
                headlineLarge: TextStyle(fontFamily: 'GT Sectra Fine'))),
      ),
    );
  }
}
