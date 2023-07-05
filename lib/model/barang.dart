class Barang {
  String? id;
  String namaBarang;
  String harga;
  String stok;
  Barang(
      {this.id,
      required this.namaBarang,
      required this.harga,
      required this.stok});
  factory Barang.fromJson(Map<String, dynamic> json) => Barang(
      id: json["id"],
      namaBarang: json["nama_barang"],
      harga: json["harga"],
      stok: json["stok"]);
  Map<String, dynamic> toJson() =>
      {"nama_barang": namaBarang, "harga": harga, "stok": stok};
}
