import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/barang.dart';

class BarangService {
  Future<List<Barang>> listData() async {
    final Response response = await ApiClient().get('barang');
    final List data = response.data as List;
    List<Barang> result = data.map((json) => Barang.fromJson(json)).toList();
    return result;
  }

  Future<Barang> simpan(Barang barang) async {
    var data = barang.toJson();
    final Response response = await ApiClient().post('barang', data);
    Barang result = Barang.fromJson(response.data);
    return result;
  }

  Future<Barang> ubah(Barang barang, String id) async {
    var data = barang.toJson();
    final Response response = await ApiClient().put('barang/${id}', data);
    print(response);
    Barang result = Barang.fromJson(response.data);
    return result;
  }

  Future<Barang> getById(String id) async {
    final Response response = await ApiClient().get('barang/${id}');
    Barang result = Barang.fromJson(response.data);
    return result;
  }

  Future<Barang> hapus(Barang barang) async {
    final Response response = await ApiClient().delete('barang/${barang.id}');
    Barang result = Barang.fromJson(response.data);
    return result;
  }
}
