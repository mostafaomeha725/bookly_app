import 'package:booklyapp1/Feature/splash/presentation/Views/widgets/Cardbook.dart';
import 'package:booklyapp1/Feature/splash/presentation/Views/widgets/ListViewFeatureBook.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 25),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 265,
              child: ListViewFeatureBook(),
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              "Newest Seller",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 18,
            ),
          ),
          SliverFillRemaining(
            child: CardBook(),
          ),
        ],
      ),
    );
  }
}
