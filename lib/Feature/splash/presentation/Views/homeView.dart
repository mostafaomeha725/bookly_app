import 'package:booklyapp1/Feature/splash/presentation/Views/widgets/homeViewBody.dart';
import 'package:booklyapp1/core/Router/goRouter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff110e24),
          title: const Image(
            image: AssetImage('assets/images/Logo.png'),
            height: 20,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  GoRouter.of(context).push(
                    AppRouter.kSearchView,
                    // extra: state.books[index],
                  );
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: const HomeViewBody());
  }
}
