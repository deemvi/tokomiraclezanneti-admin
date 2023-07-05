import 'package:flutter/material.dart';
import 'pelanggan_page.dart';
import 'pelanggan_update_form.dart';
import '../model/pelanggan.dart';

class PelangganDetail extends StatefulWidget {
  final Pelanggan pelanggan;

  const PelangganDetail({super.key, required this.pelanggan});

  @override
  State<PelangganDetail> createState() => _PelangganDetailState();
}

class _PelangganDetailState extends State<PelangganDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Pelanggan")),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Nama Pelanggan : ${widget.pelanggan.namaPelanggan}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tombolUbah(),
              _tombolHapus(),
            ],
          )
        ],
      ),
    );
  }

  _tombolUbah() {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PelangganUpdateForm(pelanggan: widget.pelanggan)));
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        child: const Text("Ubah"));
  }

  _tombolHapus() {
    return ElevatedButton(
        onPressed: () {
          AlertDialog alertDialog = AlertDialog(
            content: const Text("Yakin ingin menghapus data ini?"),
            actions: [
// tombol ya
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => PelangganPage()));
                },
                child: const Text("Ya"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              ),
// tombol batal
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Batal"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              )
            ],
          );
          showDialog(context: context, builder: (context) => alertDialog);
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: const Text("Hapus"));
  }
}
