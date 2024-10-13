import 'package:booklyapp1/Feature/splash/presentation/Manger/SimilarBooksCubit/similar_books_cubit.dart';
import 'package:booklyapp1/Feature/splash/presentation/Views/widgets/FeatureViewBody.dart';
import 'package:booklyapp1/Home/models/book_model/book_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureView extends StatefulWidget {
  const FeatureView({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  State<FeatureView> createState() => _FeatureViewState();
}

class _FeatureViewState extends State<FeatureView> {
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBook(
        category: widget.bookModel.volumeInfo.categories?[0] ?? 'programming');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FeatureViewBody(
        books: widget.bookModel,
      ),
    );
  }
}
