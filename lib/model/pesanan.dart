class Pesanan {
  String? id;
  String namaPemesan;
  String alamat;
  String noTelp;
  String namaBarang;
  String harga;
  String jumlahPesanan;
  String pesan;
  String status;
  Pesanan(
      {this.id,
      required this.namaPemesan,
      required this.alamat,
      required this.noTelp,
      required this.namaBarang,
      required this.harga,
      required this.jumlahPesanan,
      required this.pesan,
      required this.status});
  factory Pesanan.fromJson(Map<String, dynamic> json) => Pesanan(
      id: json["id"],
      namaPemesan: json["namaPemesan"],
      alamat: json["alamat"],
      noTelp: json["noTelp"],
      namaBarang: json["namaBarang"],
      harga: json["harga"],
      jumlahPesanan: json["jumlahPesanan"],
      pesan: json["pesan"],
      status: json["status"]);
  Map<String, dynamic> toJson() => {
        "namaPemesan": namaPemesan,
        "alamat": alamat,
        "noTelp": noTelp,
        "namaBarang": namaBarang,
        "harga": harga,
        "jumlahPesanan": jumlahPesanan,
        "pesan": pesan,
        "status": status
      };
}
