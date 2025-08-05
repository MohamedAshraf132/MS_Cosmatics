import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);
    final cartItems = cart.items;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F0E3),
      appBar: AppBar(
        title: const Text("Checkout", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromRGBO(208, 170, 136, 1),
        centerTitle: true,
      ),
      body: SafeArea(
        child: cartItems.isEmpty
            ? const Center(
                child: Text(
                  "Your cart is empty",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              item.product.imagePath,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.product.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text("Quantity: ${item.quantity}"),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'LE ${(item.product.price * item.quantity).toStringAsFixed(0)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.redAccent,
                                  size: 20,
                                ),
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: const Text("Remove Item"),
                                      content: const Text(
                                        "Are you sure you want to remove this item from your cart?",
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          child: const Text("Cancel"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            cart.removeItem(item.product.id);
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            "Remove",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
      bottomNavigationBar: cartItems.isEmpty
          ? null
          : Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                top: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'LE ${cart.totalPrice.toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          backgroundColor: Colors.white,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    "Choose Payment Method",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  ListTile(
                                    leading: const Icon(Icons.credit_card),
                                    title: const Text("InstaPay"),
                                    onTap: () {
                                      Navigator.pop(context);
                                      _showPaymentDetailsDialog(
                                        context: context,
                                        cart: cart,
                                        method: "InstaPay",
                                        instructions:
                                            "Please send the total amount to:\n0123456789 via InstaPay.",
                                        contactNumber: "0123456789",
                                      );
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.money),
                                    title: const Text("Cash on Delivery"),
                                    onTap: () {
                                      Navigator.pop(context);
                                      _showPaymentDetailsDialog(
                                        context: context,
                                        cart: cart,
                                        method: "Cash on Delivery",
                                        instructions:
                                            "You will pay upon delivery. Please ensure someone is available.",
                                        contactNumber: "0123456789",
                                      );
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.phone_android),
                                    title: const Text("Vodafone Cash"),
                                    onTap: () {
                                      Navigator.pop(context);
                                      _showPaymentDetailsDialog(
                                        context: context,
                                        cart: cart,
                                        method: "Vodafone Cash",
                                        instructions:
                                            "Transfer to:\n0109876543 via Vodafone Cash before confirming.",
                                        contactNumber: "0109876543",
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(208, 170, 136, 1),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Pay Now",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  void _showPaymentDetailsDialog({
    required BuildContext context,
    required CartModel cart,
    required String method,
    required String instructions,
    required String contactNumber,
  }) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    XFile? paymentProof;

    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: const EdgeInsets.all(20),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.receipt_long,
                        color: Colors.brown.shade400,
                        size: 40,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Payment via $method",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(height: 20),
                    ],
                  ),
                ),
                Text(
                  "Order Details:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.brown.shade700,
                  ),
                ),
                const SizedBox(height: 8),
                ...cart.items.map(
                  (item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      "${item.quantity} × ${item.product.name} - LE ${(item.product.price * item.quantity).toStringAsFixed(0)}",
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Total: LE ${cart.totalPrice.toStringAsFixed(0)}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  instructions,
                  style: const TextStyle(color: Colors.black87),
                ),
                const SizedBox(height: 10),
                Text(
                  "Contact: $contactNumber (WhatsApp)",
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    prefixIcon: const Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: addressController,
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: "Delivery Address",
                    prefixIcon: const Icon(Icons.home),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // رفع صورة الوصل إذا كانت الطريقة تحتاج
                if (method == "InstaPay" || method == "Vodafone Cash") ...[
                  OutlinedButton.icon(
                    onPressed: () async {
                      final picker = ImagePicker();
                      final picked = await picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      if (picked != null) {
                        setState(() {
                          paymentProof = picked;
                        });
                      }
                    },
                    icon: const Icon(Icons.upload_file),
                    label: Text(
                      paymentProof != null
                          ? "Change Payment Proof"
                          : "Upload Payment Proof",
                    ),
                  ),
                  if (paymentProof != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Uploaded: ${paymentProof!.name}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.green,
                        ),
                      ),
                    ),
                ],

                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.check_circle_outline),
                    label: const Text("Confirm Order"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(208, 170, 136, 1),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      final name = nameController.text.trim();
                      final phone = phoneController.text.trim();
                      final address = addressController.text.trim();

                      if (name.isEmpty || phone.isEmpty || address.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fill all fields."),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                        return;
                      }

                      if (phone.isEmpty || address.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fill all fields."),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                        return;
                      }

                      if ((method == "InstaPay" || method == "Vodafone Cash") &&
                          paymentProof == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please upload the payment proof."),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                        return;
                      }

                      cart.clearCart();
                      Navigator.of(context).pop(); // يغلق الدايالوج
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Order confirmed! Thank you."),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
