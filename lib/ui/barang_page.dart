import 'package:flutter/material.dart';
import '../model/barang.dart';
import '../service/barang_service.dart';
import 'barang_form.dart';
import 'barang_item.dart';
import '../widget/sidebar.dart';

class BarangPage extends StatefulWidget {
  const BarangPage({Key? key}) : super(key: key);
  _BarangPageState createState() => _BarangPageState();
}

class _BarangPageState extends State<BarangPage> {
  Stream<List<Barang>> getList() async* {
    List<Barang> data = await BarangService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Data Barang"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BarangForm()));
            },
          )
        ],
      ),
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
              return BarangItem(barang: snapshot.data[index]);
            },
          );
        },
      ),
    );
  }
}
