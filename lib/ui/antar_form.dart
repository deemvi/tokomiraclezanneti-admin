import 'package:flutter/material.dart';
import '../model/pesanan.dart';
import '../service/pesanan_service.dart';
import 'pesanan_detail.dart';

class AntarForm extends StatefulWidget {
  final Pesanan pesanan;
  const AntarForm({Key? key, required this.pesanan}) : super(key: key);
  _AntarFormState createState() => _AntarFormState();
}

class _AntarFormState extends State<AntarForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPemesanCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();
  final _noTelpCtrl = TextEditingController();
  final _namaBarangCtrl = TextEditingController();
  final _hargaCtrl = TextEditingController();
  final _jumlahPesananCtrl = TextEditingController();
  Future<Pesanan> getData() async {
    Pesanan data = await PesananService().getById(widget.pesanan.id.toString());
    setState(() {
      _namaPemesanCtrl.text = data.namaPemesan;
      _alamatCtrl.text = data.alamat;
      _noTelpCtrl.text = data.noTelp;
      _namaBarangCtrl.text = data.namaBarang;
      _hargaCtrl.text = data.harga;
      _jumlahPesananCtrl.text = data.jumlahPesanan;
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
      appBar: AppBar(title: const Text("Telah Diantar")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNamaPemesan(),
              _fieldalamat(),
              _fieldnoTelp(),
              _fieldNamaBarang(),
              _fieldharga(),
              _fieldjumlahPesanan(),
              SizedBox(height: 20),
              _tombolSimpan()
            ],
          ),
        ),
      ),
    );
  }

  _fieldNamaPemesan() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Pemesan"),
      controller: _namaPemesanCtrl,
    );
  }

  _fieldalamat() {
    return TextField(
      decoration: const InputDecoration(labelText: "Alamat"),
      controller: _alamatCtrl,
    );
  }

  _fieldnoTelp() {
    return TextField(
      decoration: const InputDecoration(labelText: "No. Telepon"),
      controller: _noTelpCtrl,
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

  _fieldjumlahPesanan() {
    return TextField(
      decoration: const InputDecoration(labelText: "Jumlah Pesanan"),
      controller: _jumlahPesananCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () async {
          Pesanan pesanan = new Pesanan(
              namaPemesan: _namaPemesanCtrl.text,
              alamat: _alamatCtrl.text,
              noTelp: _noTelpCtrl.text,
              namaBarang: _namaBarangCtrl.text,
              harga: _hargaCtrl.text,
              jumlahPesanan: _jumlahPesananCtrl.text,
              pesan:
                  "Transaksi berhasil. Terima kasih atas kepercayaan Anda terhadap Toko Miracle Zanneti. Harap screenshot halaman ini sebagai bukti pembayaran yang sah.",
              status: "Telah diantar");
          String id = widget.pesanan.id.toString();
          await PesananService().ubah(pesanan, id).then((value) {
            Navigator.pop(context);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => PesananDetail(pesanan: value)));
          });
        },
        child: const Text("Telah Diantar"));
  }
}
