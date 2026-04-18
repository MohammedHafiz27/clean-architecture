import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.img});
  final String img;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        imageUrl: img,
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
