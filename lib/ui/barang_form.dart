import 'package:flutter/material.dart';
import '../model/barang.dart';
import '../service/barang_service.dart';
import 'barang_detail.dart';

class BarangForm extends StatefulWidget {
  const BarangForm({Key? key}) : super(key: key);
  _BarangFormState createState() => _BarangFormState();
}

class _BarangFormState extends State<BarangForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaBarangCtrl = TextEditingController();
  final _hargaCtrl = TextEditingController();
  final _stokCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Barang")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNamaBarang(),
              _fieldharga(),
              _fieldstok(),
              SizedBox(height: 20),
              _tombolSimpan()
            ],
          ),
        ),
      ),
    );
  }

  _fieldNamaBarang() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Barang"),
      controller: _namaBarangCtrl,
    );
  }

  _fieldharga() {
    return TextField(
      decoration: const InputDecoration(labelText: "Harga"),
      controller: _hargaCtrl,
    );
  }

  _fieldstok() {
    return TextField(
      decoration: const InputDecoration(labelText: "Stok"),
      controller: _stokCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () async {
          Barang barang = new Barang(
              namaBarang: _namaBarangCtrl.text,
              harga: _hargaCtrl.text,
              stok: _stokCtrl.text);
          await BarangService().simpan(barang).then((value) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => BarangDetail(barang: value)));
          });
        },
        child: const Text("Simpan"));
  }
}
