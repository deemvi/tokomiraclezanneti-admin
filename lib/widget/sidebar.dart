import 'package:flutter/material.dart';
import '../ui/beranda.dart';
import '../ui/login.dart';
import '../ui/barang_page.dart';
import '../ui/pesanan_page.dart';
import '../ui/pelanggan_page.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("Admin"),
              accountEmail: Text("admin@admin.com")),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Beranda"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Beranda()));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box_sharp),
            title: Text("Daftar Pesanan"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PesananPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text("Data Barang"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BarangPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Data Pelanggan Setia"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PelangganPage()));
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.people),
          //   title: Text("Pegawai"),
          //   onTap: () {},
          // ),
          // ListTile(
          //   leading: Icon(Icons.account_box_sharp),
          //   title: Text("Pasien"),
          //   onTap: () {},
          // ),
          ListTile(
            leading: Icon(Icons.logout_rounded),
            title: Text("Keluar"),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                  (Route<dynamic> route) => false);
            },
          )
        ],
      ),
    );
  }
}
