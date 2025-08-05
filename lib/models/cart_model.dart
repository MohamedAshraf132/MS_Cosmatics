import 'package:flutter/foundation.dart';
import 'product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addToCart(Product product, [int quantity = 1]) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      _items[index].quantity = quantity;
    } else {
      _items.add(CartItem(product: product, quantity: quantity));
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _items.removeWhere((item) => item.product.id == product.id);
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

  void updateQuantity(Product product, int quantity) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _items[index].quantity = quantity;
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  double get totalPrice =>
      _items.fold(0.0, (sum, item) => sum + item.product.price * item.quantity);

  // ✅ الدوال الجديدة المطلوبة لواجهة المستخدم
  int getQuantity(Product product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    return index != -1 ? _items[index].quantity : 0;
  }

  void increaseQuantity(Product product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _items[index].quantity++;
      notifyListeners();
    }
  }

  void decreaseQuantity(Product product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1 && _items[index].quantity > 1) {
      _items[index].quantity--;
    } else if (index != -1) {
      _items.removeAt(index);
    }
    notifyListeners();
  }
}
