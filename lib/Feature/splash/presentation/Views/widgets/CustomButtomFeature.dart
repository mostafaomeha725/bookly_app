import 'package:booklyapp1/Home/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomButtomFeature extends StatelessWidget {
  const CustomButtomFeature({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: 125,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12), topLeft: Radius.circular(14)),
          ),
          child: const Center(
            child: Text(
              'Free',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            String url = bookModel.volumeInfo.previewLink ??
                "http://books.google.com.eg/books?id=9GwrmHRl490C&printsec=frontcover&dq=subject:programming&hl=&cd=1&source=gbs_api  ";

            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          child: Container(
            height: 40,
            width: 125,
            decoration: const BoxDecoration(
              color: Color(0xfffa8b5f),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  topRight: Radius.circular(14)),
            ),
            child: const Center(
              child: Text(
                'Free Preview',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
