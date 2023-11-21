import 'package:flutter/material.dart';
import 'package:micro_frontend_flutter/app/utils/constants/app_constants.dart';
import 'package:product/app/data/models/product_model.dart';
import 'package:product/app/presentation/widgets/product_image.dart';
import 'package:product/app/presentation/widgets/product_rating.dart';

class ProductCard extends StatelessWidget {
  final Product? product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _productImage(),
          const SizedBox(height: AppConstants.defaultMargin / 2),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultMargin / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _productTitle(),
                _productPrice(),
                ProductRating(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _productImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(AppConstants.defaultRadius),
        topRight: Radius.circular(AppConstants.defaultRadius),
      ),
      child: ProductImage(image: product?.thumbnail),
    );
  }

  Widget _productTitle() {
    return Text(
      product?.title ?? 'Title',
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  Widget _productPrice() {
    return Text(
      '\$${product?.price.toString() ?? '0'}',
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
