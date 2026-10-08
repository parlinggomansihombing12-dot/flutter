import 'package:flutter/material.dart';
import '../models/produk.dart';
import '../widget_basic/product_card.dart';
import 'produk_detail_page.dart';

class ProdukListPage extends StatelessWidget {
  final List<Produk> produk;
  final void Function(Produk) onTambahKeranjang;
  final void Function(Produk) onHapus;

  const ProdukListPage({
    super.key,
    required this.produk,
    required this.onTambahKeranjang,
    required this.onHapus,
  });

  @override
  Widget build(BuildContext context) {
    if (produk.isEmpty) {
      return const Center(child: Text('Belum ada produk'));
    }

    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemCount: produk.length,
      itemBuilder: (context, index) {
        final item = produk[index];
        return ProductCard(
          nama: item.nama,
          harga: item.harga,
          onTap: () async {
            final tambah = await Navigator.push<bool>(
              context,
              MaterialPageRoute(
                builder: (context) => ProdukDetailPage(produk: item),
              ),
            );
            if (tambah == true) {
              onTambahKeranjang(item);
            }
          },
          onDelete: () => onHapus(item),
        );
      },
    );
  }
}