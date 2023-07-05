import 'package:flutter/material.dart';
import '../model/pelanggan.dart';
import 'pelanggan_detail.dart';

class PelangganItem extends StatelessWidget {
  final Pelanggan pelanggan;

  const PelangganItem({super.key, required this.pelanggan});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text("${pelanggan.namaPelanggan}"),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PelangganDetail(pelanggan: pelanggan)));
      },
    );
  }
}
