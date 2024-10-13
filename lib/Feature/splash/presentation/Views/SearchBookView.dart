import 'package:booklyapp1/Feature/splash/presentation/Views/widgets/SearchBookViewBody.dart';
import 'package:flutter/material.dart';

class SearchBookView extends StatelessWidget {
  const SearchBookView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchBookViewBody(),
    );
  }
}
