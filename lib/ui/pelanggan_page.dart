import 'package:flutter/material.dart';
import '../model/pelanggan.dart';
import 'pelanggan_item.dart';
import 'pelanggan_form.dart';
import '../widget/sidebar.dart';

class PelangganPage extends StatefulWidget {
  const PelangganPage({super.key});

  @override
  State<PelangganPage> createState() => _PelangganPageState();
}

class _PelangganPageState extends State<PelangganPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Data Pelanggan Setia"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PelangganForm()));
            },
          )
        ],
      ),
      body: ListView(
        children: [
          PelangganItem(pelanggan: Pelanggan(namaPelanggan: "Bu Indri")),
          PelangganItem(pelanggan: Pelanggan(namaPelanggan: "Bu Bella")),
          PelangganItem(pelanggan: Pelanggan(namaPelanggan: "Pak Sumariyo")),
          PelangganItem(pelanggan: Pelanggan(namaPelanggan: "Bu Tari")),
          PelangganItem(pelanggan: Pelanggan(namaPelanggan: "Pak Hendra")),
          PelangganItem(pelanggan: Pelanggan(namaPelanggan: "Bu Indah")),
          PelangganItem(pelanggan: Pelanggan(namaPelanggan: "Bu Syahnaz")),
          PelangganItem(pelanggan: Pelanggan(namaPelanggan: "Pak Husein")),
        ],
      ),
    );
  }
}
