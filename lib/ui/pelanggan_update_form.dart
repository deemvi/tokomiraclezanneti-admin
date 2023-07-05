import 'package:flutter/material.dart';
import '../model/pelanggan.dart';
import '../ui/pelanggan_detail.dart';

class PelangganUpdateForm extends StatefulWidget {
  final Pelanggan pelanggan;
  const PelangganUpdateForm({Key? key, required this.pelanggan})
      : super(key: key);
  _PelangganUpdateFormState createState() => _PelangganUpdateFormState();
}

class _PelangganUpdateFormState extends State<PelangganUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPelangganCtrl = TextEditingController();
  @override
  void initState() {
    super.initState();
    setState(() {
      _namaPelangganCtrl.text = widget.pelanggan.namaPelanggan;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Data Pelanggan")),
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
          Navigator.pop(context);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => PelangganDetail(pelanggan: pelanggan)));
        },
        child: const Text("Simpan Perubahan"));
  }
}
