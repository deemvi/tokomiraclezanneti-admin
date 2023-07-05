import 'package:flutter/material.dart';
import '../service/pesanan_service.dart';
import 'konfirmasi_form.dart';
import 'antar_form.dart';
import '../model/pesanan.dart';

class PesananDetail extends StatefulWidget {
  final Pesanan pesanan;
  const PesananDetail({Key? key, required this.pesanan}) : super(key: key);
  _PesananDetailState createState() => _PesananDetailState();
}

class _PesananDetailState extends State<PesananDetail> {
  Stream<Pesanan> getData() async* {
    Pesanan data = await PesananService().getById(widget.pesanan.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Pesanan")),
      body: StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Text('Data Tidak Ditemukan');
          }
          return Column(
            children: [
              SizedBox(height: 20),
              Text(
                "Nama Pemesan : ${snapshot.data.namaPemesan}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Alamat : ${snapshot.data.alamat}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "No. Telepon : ${snapshot.data.noTelp}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Nama Barang : ${snapshot.data.namaBarang}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Harga : ${snapshot.data.harga}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Jumlah Pesanan : ${snapshot.data.jumlahPesanan}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Status : ${snapshot.data.status}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [_tombolKonfirmasi(), _tombolAntar()],
              )
            ],
          );
        },
      ),
    );
  }

  _tombolKonfirmasi() {
    return StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          KonfirmasiForm(pesanan: snapshot.data)));
            },
            style: ElevatedButton.styleFrom(primary: Colors.green),
            child: const Text("Konfirmasi")));
  }

  _tombolAntar() {
    return StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AntarForm(pesanan: snapshot.data)));
            },
            style: ElevatedButton.styleFrom(primary: Colors.blue),
            child: const Text("Telah Diantar")));
  }

  _tombolSimpan() {
    StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          return ElevatedButton(
              onPressed: () async {
                Pesanan pesanan = new Pesanan(
                    namaPemesan: "${snapshot.data.namaPemesan}",
                    alamat: "${snapshot.data.alamat}",
                    noTelp: "${snapshot.data.noTelp}",
                    namaBarang: "${snapshot.data.namaBarang}",
                    harga: "${snapshot.data.harga}",
                    jumlahPesanan: "${snapshot.data.jumlahPesanan}",
                    pesan:
                        "Pesanan telah Dikonfirmasi. Harap tunggu 1 * 24 jam. Pengembalian barang hanya dapat dilakukan apabila pengantar belum meninggalkan tempat Anda",
                    status: "Telah dikonfirmasi");
                String id = widget.pesanan.id.toString();
                await PesananService().ubah(pesanan, id).then((value) {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PesananDetail(pesanan: value)));
                });
              },
              child: const Text("Konfirmasi"));
        });
  }
}
