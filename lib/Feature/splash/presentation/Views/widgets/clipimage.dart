import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ClipImage extends StatelessWidget {
  const ClipImage({super.key, required this.imageurl});
  final String imageurl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageurl,
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
          ),
        ),
      ),
    );
  }
}
