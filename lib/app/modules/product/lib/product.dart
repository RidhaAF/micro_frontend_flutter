library product;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/app/presentation/cubit/product/product_cubit.dart';
import 'package:product/app/presentation/pages/product/product_page.dart';
import 'package:product/app/routes/app_pages.dart';
import 'package:product/injection.dart';

class ProductApp extends StatelessWidget {
  ProductApp({super.key});

  static ProductApp create() {
    setupInjection();
    return ProductApp();
  }

  final ProductCubit productCubit = di<ProductCubit>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => productCubit),
      ],
      child: MaterialApp(
        title: 'Product',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ProductPage(),
        routes: AppPages.pages,
      ),
    );
  }
}
