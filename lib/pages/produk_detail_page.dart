import 'package:flutter/material.dart';
import '../models/produk.dart';

class ProdukDetailPage extends StatelessWidget {
  final Produk produk;

  const ProdukDetailPage({super.key, required this.produk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const Icon(Icons.inventory_2, size: 120, color: Colors.deepPurple),
            const SizedBox(height: 24),
            Text(
              produk.nama,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Rp ${produk.harga}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context, true),
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Tambah ke Keranjang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}