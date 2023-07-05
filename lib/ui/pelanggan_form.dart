import 'package:flutter/material.dart';
import 'package:tokomiraclezannetia/model/pelanggan.dart';
import 'package:tokomiraclezannetia/ui/pelanggan_detail.dart';

class PelangganForm extends StatefulWidget {
  const PelangganForm({Key? key}) : super(key: key);
  _PelangganFormState createState() => _PelangganFormState();
}

class _PelangganFormState extends State<PelangganForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPelangganCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Pelanggan")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNamaPelanggan(),
              SizedBox(height: 20),
              _tombolSimpan()
            ],
          ),
        ),
      ),
    );
  }

  _fieldNamaPelanggan() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Pelanggan"),
      controller: _namaPelangganCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () {
          Pelanggan pelanggan =
              new Pelanggan(namaPelanggan: _namaPelangganCtrl.text);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => PelangganDetail(pelanggan: pelanggan)));
        },
        child: const Text("Simpan"));
  }
}
