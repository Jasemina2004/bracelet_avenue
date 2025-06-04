import 'package:flutter/material.dart';
import 'package:bracelet_avenue/models/product.dart';

class CartScreen extends StatelessWidget {
  final List<Product> cartItems;
  final Function(Product) onRemoveItem;

  const CartScreen({
    super.key,
    required this.cartItems,
    required this.onRemoveItem,
  });

  // Llogarit totalin
  double getTotal() {
    double total = 0;
    for (var item in cartItems) {
      total += item.price;
    }
    return total;
  }

  // Funksioni për checkout
  void checkout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Faleminderit për porosinë!"),
        content: Text(
          "Porosia juaj me vlerë \$${getTotal().toStringAsFixed(2)} do të dërgohet së shpejti.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shporta Juaj"),
      ),
      body: Column(
        children: [
          // Lista e produkteve
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final product = cartItems[index];
                return ListTile(
                  leading: Image.asset(
                    product.imageUrl,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(product.name),
                  subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => onRemoveItem(product),
                  ),
                );
              },
            ),
          ),

          // Totali + Butoni Checkout
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Totali:", style: TextStyle(fontSize: 18)),
                    Text(
                      "\$${getTotal().toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.all(16),
                    ),
                    onPressed: () => checkout(context),
                    child: const Text(
                      "CHECKOUT",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
