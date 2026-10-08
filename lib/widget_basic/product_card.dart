import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String nama;
  final int harga;
  final VoidCallback onTap;
  final VoidCallback? onDelete;

  const ProductCard({
    super.key,
    required this.nama,
    required this.harga,
    required this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.inventory_2, size: 48, color: Colors.deepPurple),
                  const SizedBox(height: 8),
                  Text(
                    nama,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Rp $harga',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            if (onDelete != null)
              Positioned(
                top: -8,
                right: -8,
                child: IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                  onPressed: onDelete,
                ),
              ),
          ],
        ),
      ),
    );
  }
}