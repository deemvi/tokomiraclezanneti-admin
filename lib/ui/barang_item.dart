import 'package:flutter/material.dart';
import '../model/barang.dart';
import 'barang_detail.dart';

class BarangItem extends StatelessWidget {
  final Barang barang;

  const BarangItem({super.key, required this.barang});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text("${barang.namaBarang}"),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BarangDetail(barang: barang)));
      },
    );
  }
}
