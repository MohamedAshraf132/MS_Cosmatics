import 'package:flutter/material.dart';
import '../view_models/product_view_model.dart';
import 'product_card.dart';
import 'cart_screen.dart'; // ✅ صفحة السلة
import 'checkout_screen.dart'; // ✅ صفحة الشيك أوت

class ProductListScreen extends StatelessWidget {
  final ProductViewModel viewModel = ProductViewModel();

  ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = viewModel.getProducts();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F0E3),

      drawer: Drawer(
        // ✅ أضف هذا الجزء
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(208, 170, 136, 1),
              ),
              child: Image.asset('assets/images/sokra.png'), // شعار
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('السلة'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('الدفع'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CheckoutScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(208, 170, 136, 1),
        elevation: 0,
        centerTitle: true,
        title: Image.asset('assets/images/sokra.png', height: 60), // قلل الحجم
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
