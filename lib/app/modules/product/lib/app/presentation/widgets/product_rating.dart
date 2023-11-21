import 'package:flutter/material.dart';
import 'package:product/app/data/models/product_model.dart';

class ProductRating extends StatelessWidget {
  final Product? product;
  const ProductRating({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star_rounded,
          color: Colors.yellow.shade600,
          size: 16,
        ),
        Text(
          product?.rating.toString() ?? '0.0',
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
