import 'package:flutter/material.dart';
import '../models/gadget_model.dart';
import 'discount_page.dart';

class DetailCardPage extends StatefulWidget {
  final Gadget gadget;

  const DetailCardPage({super.key, required this.gadget});

  @override
  State<DetailCardPage> createState() => _DetailCardPageState();
}

class _DetailCardPageState extends State<DetailCardPage> {
  int discountPercentage = 0;

  @override
  Widget build(BuildContext context) {
    double finalPrice =
        widget.gadget.price - (widget.gadget.price * (discountPercentage / 100));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Produk"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.gadget.icon, size: 100, color: Colors.blue),
              const SizedBox(height: 20),
              Text(
                widget.gadget.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Harga Asli: Rp ${widget.gadget.price}",
                style: TextStyle(
                  fontSize: 16,
                  decoration: discountPercentage > 0
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  color: discountPercentage > 0 ? Colors.red : Colors.black,
                ),
              ),
              if (discountPercentage > 0) ...[
                const SizedBox(height: 5),
                Text(
                  "Diskon: $discountPercentage%",
                  style: const TextStyle(fontSize: 16, color: Colors.green),
                ),
                const SizedBox(height: 5),
                Text(
                  "Harga Setelah Diskon: Rp ${finalPrice.toInt()}",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ],
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: const Icon(Icons.local_offer),
                label: const Text("Klaim Voucher Discount"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  // Await Navigator.push menunggu data balik dari DiscountPage
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DiscountPage(),
                    ),
                  );

                  if (result != null) {
                    setState(() {
                      discountPercentage = result as int;
                    });
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}