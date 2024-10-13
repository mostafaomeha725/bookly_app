import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.onsubmit});
  final void Function(String) onsubmit;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onsubmit,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          hintText: 'Search',
          suffixIcon: const Icon(
            Icons.search,
            size: 35,
          ),
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.35))),
    );
  }
}
