import 'package:flutter/material.dart';
import '../model/pesanan.dart';
import '../service/pesanan_service.dart';
import 'pesanan_item.dart';
import '../widget/sidebar.dart';

class PesananPage extends StatefulWidget {
  const PesananPage({Key? key}) : super(key: key);
  _PesananPageState createState() => _PesananPageState();
}

class _PesananPageState extends State<PesananPage> {
  Stream<List<Pesanan>> getList() async* {
    List<Pesanan> data = await PesananService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(title: const Text("Daftar Pesanan")),
      body: StreamBuilder(
        stream: getList(),
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
            return Text('Data Kosong');
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return PesananItem(pesanan: snapshot.data[index]);
            },
          );
        },
      ),
    );
  }
}
