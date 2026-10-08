import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final TextEditingController _namaController = TextEditingController();
  String _preview = '';

  @override
  void dispose() {
    _namaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextField')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Anda',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ), // InputDecoration
              onChanged: (value) {
                setState(() {
                  _preview = value;
                });
              },
            ), // TextField
            const SizedBox(height: 16),
            Text('Halo, $_preview!'),
          ],
        ), // Column
      ), // Padding
    ); // Scaffold
  }
}