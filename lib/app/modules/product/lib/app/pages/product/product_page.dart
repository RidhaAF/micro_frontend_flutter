import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/app/cubit/product/product_cubit.dart';
import 'package:product/app/models/product_model.dart';
import 'package:micro_frontend_flutter/app/utils/constants/app_constants.dart';
import 'package:micro_frontend_flutter/app/widgets/default_loading_indicator.dart';
import 'package:micro_frontend_flutter/app/widgets/default_refresh_indicator.dart';
import 'package:micro_frontend_flutter/app/widgets/error_message.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  void _getProducts() {
    context.read<ProductCubit>().getProducts();
  }

  Future<void> _onRefresh() async {
    _getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
      ),
      body: _productApp(),
    );
  }

  Widget _productApp() {
    return DefaultRefreshIndicator(
      onRefresh: () => _onRefresh(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const DefaultLoadingIndicator();
          } else if (state is ProductLoaded) {
            final products = state.products;

            return _productGrid(products.products);
          } else if (state is ProductError) {
            return ErrorMessage(
              message: state.message,
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _productGrid(List<Product>? products) {
    final int productsLength = products?.length ?? 0;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      padding: const EdgeInsets.all(AppConstants.defaultMargin),
      itemCount: productsLength,
      itemBuilder: (context, index) {
        final product = products?[index];

        return _productCard(product);
      },
    );
  }

  Widget _productCard(Product? product) {
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
