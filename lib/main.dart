import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ms_cosmatics/models/cart_model.dart';
import 'package:ms_cosmatics/views/cart_screen.dart';
import 'package:ms_cosmatics/views/checkout_screen.dart';
import 'package:provider/provider.dart';
import 'views/product_list_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CartModel())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/cart': (context) => const CartScreen(),
        '/checkout': (context) => const CheckoutScreen(),
      },
      title: 'MS Cosmetics',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,

        // الخط لجميع النصوص في التطبيق
        textTheme: GoogleFonts.cairoTextTheme(),

        // النصوص في AppBar وغيره
        primaryTextTheme: GoogleFonts.cairoTextTheme(),

        // لون خلفية كل Scaffold
        scaffoldBackgroundColor: const Color(0xFFF8F0E3),

        // تثبيت شكل الـ AppBar عالميًا
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromRGBO(
            169,
            134,
            98,
            1,
          ), // لون الاب بار
          titleTextStyle: GoogleFonts.cairo(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
          centerTitle: true, // في حال تحب العنوان يكون في المنتصف
        ),
      ),
      home: ProductListScreen(),
    );
  }
}
