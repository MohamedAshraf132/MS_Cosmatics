import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/cart_model.dart';
import 'checkout_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double discount = 100 - ((product.price / product.oldPrice) * 100);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(208, 170, 136, 1),
      appBar: AppBar(
        title: Text(product.name, style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromRGBO(208, 170, 136, 1),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // صورة المنتج
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  product.imagePath,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 30),

              // اسم المنتج
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),

              // بطاقة السعر بالتفصيل
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 227, 212, 212),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PRICE',
                      style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'LE ${product.oldPrice.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'LE ${product.price.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'you save LE ${(product.oldPrice - product.price).toStringAsFixed(0)}',
                      style: const TextStyle(fontSize: 14, color: Colors.teal),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // عداد الكمية وزر الإضافة للسلة
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 227, 212, 212),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // هنا يمكننا تنفيذ وظيفة تخفيض الكمية
                          },
                          icon: const Icon(Icons.remove, color: Colors.black),
                        ),
                        const Text(
                          '1',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        IconButton(
                          onPressed: () {
                            // هنا يمكننا تنفيذ وظيفة زيادة الكمية
                          },
                          icon: const Icon(Icons.add, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Provider.of<CartModel>(
                          context,
                          listen: false,
                        ).addToCart(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product.name} added to cart'),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Color.fromARGB(255, 227, 212, 212),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      child: const Text(
                        'Add to cart',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {
                  Provider.of<CartModel>(
                    context,
                    listen: false,
                  ).addToCart(product);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CheckoutScreen()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  side: const BorderSide(
                    color: Color.fromARGB(255, 227, 212, 212),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: const Text(
                  'BUY IT NOW',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
              const SizedBox(height: 24),

              // التفاصيل
              const Text(
                'Description:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Text(
                product.description,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 12),

              const Text(
                'Benefits:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Text(
                product.benefits,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 12),

              const Text(
                'How to Use:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Text(
                product.howToUse,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
