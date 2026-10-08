import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({super.key});

  void _tampilkanKonfirmasi(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Hapus Item?'),
          content: const Text('Item ini akan dihapus secara permanen.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Item telah dihapus')),
                );
              },
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialog')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _tampilkanKonfirmasi(context),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: const Text('Hapus Item'),
        ),
      ),
    );
  }
}