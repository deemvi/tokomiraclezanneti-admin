import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/pesanan.dart';

class PesananService {
  Future<List<Pesanan>> listData() async {
    final Response response = await ApiClient().get('pesanan');
    final List data = response.data as List;
    List<Pesanan> result = data.map((json) => Pesanan.fromJson(json)).toList();
    return result;
  }

  Future<Pesanan> simpan(Pesanan pesanan) async {
    var data = pesanan.toJson();
    final Response response = await ApiClient().post('pesanan', data);
    Pesanan result = Pesanan.fromJson(response.data);
    return result;
  }

  Future<Pesanan> ubah(Pesanan pesanan, String id) async {
    var data = pesanan.toJson();
    final Response response = await ApiClient().put('pesanan/${id}', data);
    print(response);
    Pesanan result = Pesanan.fromJson(response.data);
    return result;
  }

  Future<Pesanan> getById(String id) async {
    final Response response = await ApiClient().get('pesanan/${id}');
    Pesanan result = Pesanan.fromJson(response.data);
    return result;
  }

  Future<Pesanan> hapus(Pesanan pesanan) async {
    final Response response = await ApiClient().delete('pesanan/${pesanan.id}');
    Pesanan result = Pesanan.fromJson(response.data);
    return result;
  }
}
