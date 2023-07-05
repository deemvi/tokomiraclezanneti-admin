import 'package:flutter/material.dart';
import '../model/pesanan.dart';
import 'pesanan_detail.dart';

class PesananItem extends StatelessWidget {
  final Pesanan pesanan;

  const PesananItem({super.key, required this.pesanan});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text("${pesanan.status}, ${pesanan.namaBarang}"),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PesananDetail(pesanan: pesanan)));
      },
    );
  }
}
