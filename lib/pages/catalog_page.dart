import 'package:flutter/material.dart';
import '../models/gadget_model.dart';
import 'detail_card_page.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Gadget> gadgetList = [
      Gadget(name: "Smartphone X", price: 5000000, icon: Icons.phone_android),
      Gadget(name: "Laptop Pro", price: 12000000, icon: Icons.laptop),
      Gadget(name: "Smartwatch Z", price: 1500000, icon: Icons.watch),
      Gadget(name: "Wireless Earbuds", price: 800000, icon: Icons.headset),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("TechExpress - Katalog"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: gadgetList.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final gadget = gadgetList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailCardPage(gadget: gadget),
                ),
              );
            },
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(gadget.icon, size: 40, color: Colors.blue),
                title: Text(
                  gadget.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Rp ${gadget.price}"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}