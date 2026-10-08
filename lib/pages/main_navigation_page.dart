import 'package:flutter/material.dart';
import '../models/produk.dart';
import 'form_tambah_produk_page.dart';
import 'produk_list_page.dart';
import 'profil_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _tabTerpilih = 0;
  int _jumlahKeranjang = 0;

  final List<Produk> _produk = [
    const Produk(nama: 'Kursi Minimalis', harga: 350000),
    const Produk(nama: 'Meja Kerja Kayu', harga: 750000),
    const Produk(nama: 'Lampu Meja LED', harga: 120000),
    const Produk(nama: 'Rak Buku Susun', harga: 450000),
    const Produk(nama: 'Sofa Santai', harga: 1500000),
  ];

  void _tampilkanSnackBar(String pesan) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(pesan)));
  }

  void _tambahKeKeranjang(Produk produk) {
    setState(() {
      _jumlahKeranjang++;
    });
    _tampilkanSnackBar('${produk.nama} ditambahkan ke keranjang');
  }

  Future<void> _bukaFormTambah() async {
    final hasil = await Navigator.push<Produk>(
      context,
      MaterialPageRoute(builder: (context) => const FormTambahProdukPage()),
    );

    if (hasil != null && mounted) {
      setState(() {
        _produk.add(hasil);
      });
      _tampilkanSnackBar('${hasil.nama} berhasil ditambahkan');
    }
  }

  Future<void> _konfirmasiHapus(Produk produk) async {
    final yakin = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Hapus Produk?'),
          content: Text('${produk.nama} akan dihapus dari daftar.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );

    if (yakin == true && mounted) {
      setState(() {
        _produk.remove(produk);
      });
      _tampilkanSnackBar('${produk.nama} berhasil dihapus');
    }
  }

  Widget _ikonKeranjang() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            _tampilkanSnackBar('Keranjang berisi $_jumlahKeranjang item');
          },
        ),
        if (_jumlahKeranjang > 0)
          Positioned(
            right: 4,
            top: 4,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$_jumlahKeranjang',
                style: const TextStyle(color: Colors.white, fontSize: 11),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final halaman = [
      ProdukListPage(
        produk: _produk,
        onTambahKeranjang: _tambahKeKeranjang,
        onHapus: _konfirmasiHapus,
      ),
      const ProfilPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_tabTerpilih == 0 ? 'Daftar Produk' : 'Profil'),
        actions: [
          _ikonKeranjang(),
          const SizedBox(width: 8),
        ],
      ),
      body: halaman[_tabTerpilih],
      floatingActionButton: _tabTerpilih == 0
          ? FloatingActionButton(
              onPressed: _bukaFormTambah,
              tooltip: 'Tambah Produk',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabTerpilih,
        onTap: (index) {
          setState(() {
            _tabTerpilih = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Produk',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}