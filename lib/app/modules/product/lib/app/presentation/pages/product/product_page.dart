import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micro_frontend_flutter/app/presentation/widgets/default_loading_indicator.dart';
import 'package:micro_frontend_flutter/app/presentation/widgets/default_refresh_indicator.dart';
import 'package:micro_frontend_flutter/app/presentation/widgets/error_message.dart';
import 'package:product/app/presentation/cubit/product/product_cubit.dart';
import 'package:product/app/presentation/widgets/product_grid.dart';
import 'package:product/injection.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late ProductCubit _productCubit;

  void _getProducts() {
    if (!_productCubit.isClosed) {
      _productCubit.getProducts();
    }
  }

  Future<void> _onRefresh() async {
    _getProducts();
  }

  @override
  void initState() {
    super.initState();
    _productCubit = di<ProductCubit>();
    _getProducts();
  }

  @override
  void dispose() {
    _productCubit.close();
    super.dispose();
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
        bloc: _productCubit,
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
