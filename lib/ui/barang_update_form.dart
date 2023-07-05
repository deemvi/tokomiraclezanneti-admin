import 'package:flutter/material.dart';
import '../model/barang.dart';
import '../service/barang_service.dart';
import 'barang_detail.dart';

class BarangUpdateForm extends StatefulWidget {
  final Barang barang;
  const BarangUpdateForm({Key? key, required this.barang}) : super(key: key);
  _BarangUpdateFormState createState() => _BarangUpdateFormState();
}

class _BarangUpdateFormState extends State<BarangUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaBarangCtrl = TextEditingController();
  final _hargaCtrl = TextEditingController();
  final _stokCtrl = TextEditingController();
  Future<Barang> getData() async {
    Barang data = await BarangService().getById(widget.barang.id.toString());
    setState(() {
      _namaBarangCtrl.text = data.namaBarang;
      _hargaCtrl.text = data.harga;
      _stokCtrl.text = data.stok;
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Data Barang")),
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
          String id = widget.barang.id.toString();
          await BarangService().ubah(barang, id).then((value) {
            Navigator.pop(context);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => BarangDetail(barang: value)));
          });
        },
        child: const Text("Simpan Perubahan"));
  }
}
