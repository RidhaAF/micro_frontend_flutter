import 'package:flutter/material.dart';
import 'package:micro_frontend_flutter/app/utils/constants/app_constants.dart';
import 'package:product/app/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product? product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppConstants.defaultRadius),
              topRight: Radius.circular(AppConstants.defaultRadius),
            ),
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.network(
                product?.thumbnail ??
                    'https://i.dummyjson.com/data/products/1/thumbnail.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: AppConstants.defaultMargin / 2),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultMargin / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product?.title ?? 'Title',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  '\$${product?.price.toString() ?? '0'}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
