import 'package:flutter/material.dart';
import 'package:micro_frontend_flutter/app/utils/constants/app_constants.dart';
import 'package:product/app/data/models/product_model.dart';
import 'package:product/app/presentation/widgets/product_card.dart';

class ProductGrid extends StatelessWidget {
  final List<Product>? products;
  const ProductGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      padding: const EdgeInsets.all(AppConstants.defaultMargin),
      itemCount: products?.length ?? 0,
      itemBuilder: (context, i) {
        final product = products?[i];

        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/products/:id',
              arguments: product,
            );
          },
          child: ProductCard(
            product: product,
          ),
        );
      },
    );
  }
}
