import 'package:flutter/material.dart';

class RateCard extends StatelessWidget {
  const RateCard({
    super.key,
    required this.rating,
    required this.count,
  });
  final num rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'Free',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
        ),
        const Spacer(
          flex: 4,
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.star,
              color: Colors.yellow,
            )),
        Text(
          rating.toString(),
          style: const TextStyle(fontSize: 18),
        ),
        Text(
          '  (${count.toString()})',
          style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.6)),
        ),
        const Spacer(
          flex: 3,
        )
      ],
    );
  }
}
