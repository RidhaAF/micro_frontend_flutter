import 'package:flutter/material.dart';
import 'package:micro_frontend_flutter/app/modules/product/lib/app/widgets/product_image.dart';
import 'package:micro_frontend_flutter/app/modules/product/lib/app/widgets/product_rating.dart';
import 'package:micro_frontend_flutter/app/utils/constants/app_constants.dart';
import 'package:product/app/models/product_model.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late Product? product;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    product = ModalRoute.of(context)!.settings.arguments as Product;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product?.title ?? 'Title'),
      ),
      body: _productDetailApp(),
    );
  }

  Widget _productDetailApp() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImage(image: product?.images?.first),
          const SizedBox(height: AppConstants.defaultMargin),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _productTitle(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _productPrice(),
                    ProductRating(product: product),
                  ],
                ),
                const SizedBox(height: AppConstants.defaultMargin / 2),
                _productDescription(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _productTitle() {
    return Text(
      product?.title ?? 'Title',
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }

  Widget _productPrice() {
    return Text(
      '\$${product?.price.toString() ?? '0'}',
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _productDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          product?.description ?? 'Description',
          style: const TextStyle(
            color: Colors.black54,
          ),
        )
      ],
    );
  }
}
