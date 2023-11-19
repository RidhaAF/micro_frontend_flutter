import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micro_frontend_flutter/app/modules/product/lib/app/widgets/product_grid.dart';
import 'package:micro_frontend_flutter/app/widgets/default_loading_indicator.dart';
import 'package:micro_frontend_flutter/app/widgets/default_refresh_indicator.dart';
import 'package:micro_frontend_flutter/app/widgets/error_message.dart';
import 'package:product/app/cubit/product/product_cubit.dart';

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
            final products = state.products.products;

            return ProductGrid(products: products);
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
}
