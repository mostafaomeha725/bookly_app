import 'package:booklyapp1/Feature/splash/presentation/Views/widgets/CustomButtomFeature.dart';
import 'package:booklyapp1/Feature/splash/presentation/Views/widgets/ListViewRelevance.dart';
import 'package:booklyapp1/Feature/splash/presentation/Views/widgets/clipimage.dart';
import 'package:booklyapp1/Home/models/book_model/book_model.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeatureViewBody extends StatelessWidget {
  const FeatureViewBody({
    super.key,
    required this.books,
  });
  final BookModel books;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  child: const Icon(Icons.close)),
              const Icon(Icons.shopping_cart)
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ClipImage(
                imageurl: books.volumeInfo.imageLinks?.thumbnail ??
                    "http://books.google.com/books/content?id=lESCCXkdy3YC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            books.volumeInfo.title ?? "",
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 4,
          ),
          Center(
            child: Text(
              books.volumeInfo.authors![0],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w200),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          CustomButtomFeature(
            bookModel: books,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'You can also like',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const ListViewRelevance(),
        ],
      ),
    );
  }
}
