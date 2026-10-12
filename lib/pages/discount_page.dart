import 'package:flutter/material.dart';

class DiscountPage extends StatelessWidget {
  const DiscountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pilih Voucher Diskon"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.discount, color: Colors.green),
                title: const Text("Voucher Diskon 10%"),
                trailing: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 10);
                  },
                  child: const Text("Gunakan"),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                leading: const Icon(Icons.discount, color: Colors.green),
                title: const Text("Voucher Diskon 20%"),
                trailing: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 20);
                  },
                  child: const Text("Gunakan"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}