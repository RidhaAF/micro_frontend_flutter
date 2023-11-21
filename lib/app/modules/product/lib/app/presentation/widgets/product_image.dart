import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String? image;
  const ProductImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Image.network(
        image ?? 'https://i.dummyjson.com/data/products/1/thumbnail.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
