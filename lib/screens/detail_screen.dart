import 'package:flutter/material.dart';
import '../models/product.dart';

class DetailScreen extends StatefulWidget {
  final Product product;

  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool sepeteEklendi = false;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ürün Detayı'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.image,
                height: 250,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              product.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${product.price}',
              style: const TextStyle(
                fontSize: 24,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                product.category.toUpperCase(),
                style: const TextStyle(color: Colors.deepPurple, fontSize: 12),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Açıklama',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    sepeteEklendi = !sepeteEklendi;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        sepeteEklendi
                            ? '✅ Sepete eklendi!'
                            : '❌ Sepetten çıkarıldı!',
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                icon: Icon(
                  sepeteEklendi
                      ? Icons.remove_shopping_cart
                      : Icons.add_shopping_cart,
                ),
                label: Text(sepeteEklendi ? 'Sepetten Çıkar' : 'Sepete Ekle'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
