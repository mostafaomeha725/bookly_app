import 'package:booklyapp1/core/Router/goRouter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FailureWidget extends StatefulWidget {
  const FailureWidget({super.key});

  @override
  State<FailureWidget> createState() => _FailureWidgetState();
}

class _FailureWidgetState extends State<FailureWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(
            AppRouter.kSearchView,
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 5.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: const Text(
            ' Please Click Here to Try Again',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
