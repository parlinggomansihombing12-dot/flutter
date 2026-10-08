import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _jumlah = 0;

  void _tambah() {
    setState(() {
      _jumlah++;
    });
  }

  void _kurang() {
    setState(() {
      if (_jumlah > 0) _jumlah--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_jumlah',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ), // Text
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _kurang,
                  icon: const Icon(Icons.remove_circle, size: 36),
                ), // IconButton
                const SizedBox(width: 24),
                IconButton(
                  onPressed: _tambah,
                  icon: const Icon(Icons.add_circle, size: 36),
                ), // IconButton
              ],
            ), // Row
          ],
        ), // Column
      ), // Center
    ); // Scaffold
  }
}