import 'package:flutter/material.dart';
import '../service/barang_service.dart';
import 'barang_page.dart';
import 'barang_update_form.dart';
import '../model/barang.dart';

class BarangDetail extends StatefulWidget {
  final Barang barang;
  const BarangDetail({Key? key, required this.barang}) : super(key: key);
  _BarangDetailState createState() => _BarangDetailState();
}

class _BarangDetailState extends State<BarangDetail> {
  Stream<Barang> getData() async* {
    Barang data = await BarangService().getById(widget.barang.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Barang")),
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
                "Nama Barang : ${snapshot.data.namaBarang}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Harga : ${snapshot.data.harga}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Stok : ${snapshot.data.stok}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [_tombolUbah(), _tombolHapus()],
              )
            ],
          );
        },
      ),
    );
  }

  _tombolUbah() {
    return StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          BarangUpdateForm(barang: snapshot.data)));
            },
            style: ElevatedButton.styleFrom(primary: Colors.blue),
            child: const Text("Ubah")));
  }

  _tombolHapus() {
    return ElevatedButton(
        onPressed: () {
          AlertDialog alertDialog = AlertDialog(
            content: const Text("Yakin ingin menghapus data ini?"),
            actions: [
              StreamBuilder(
                  stream: getData(),
                  builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
                        onPressed: () async {
                          await BarangService()
                              .hapus(snapshot.data)
                              .then((value) {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BarangPage()));
                          });
                        },
                        child: const Text("Ya"),
                        style: ElevatedButton.styleFrom(primary: Colors.blue),
                      )),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Batal"),
                style: ElevatedButton.styleFrom(primary: Colors.red),
              )
            ],
          );
          showDialog(context: context, builder: (context) => alertDialog);
        },
        style: ElevatedButton.styleFrom(primary: Colors.red),
        child: const Text("Hapus"));
  }
}
