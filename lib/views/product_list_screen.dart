import 'package:flutter/material.dart';
import '../view_models/product_view_model.dart';
import 'product_card.dart';

class ProductListScreen extends StatelessWidget {
  final ProductViewModel viewModel = ProductViewModel();

  ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = viewModel.getProducts();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F0E3),

      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(208, 170, 136, 1),
        elevation: 0,
        centerTitle: true,
        title: Image.asset('assets/images/sokra.png', height: 210),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(
          top: 100,
          left: 12,
          right: 12,
          bottom: 12,
        ),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}
