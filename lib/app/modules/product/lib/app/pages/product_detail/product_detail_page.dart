import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:micro_frontend_flutter/app/utils/constants/app_constants.dart';
import 'package:product/app/models/product_model.dart';
import 'package:product/app/widgets/product_image.dart';
import 'package:product/app/widgets/product_rating.dart';

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
          _productCarouselImages(),
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

  Widget _productCarouselImages() {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: product?.images?.length,
          itemBuilder: (context, i, realIndex) {
            return Stack(
              children: [
                ProductImage(image: product?.images?[i]),
                _imagesLength(i),
              ],
            );
          },
          options: CarouselOptions(
            aspectRatio: 1 / 1,
            viewportFraction: 1,
            enableInfiniteScroll: false,
            initialPage: 0,
            autoPlay: false,
          ),
        ),
      ],
    );
  }

  Widget _imagesLength(int index) {
    final currentPosition = index + 1;

    return Positioned(
      bottom: AppConstants.defaultMargin / 2,
      left: AppConstants.defaultMargin / 2,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.defaultMargin / 2,
          vertical: AppConstants.defaultMargin / 4,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        ),
        child: Text('$currentPosition / ${product?.images?.length}'),
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
