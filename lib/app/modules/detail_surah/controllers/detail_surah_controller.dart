import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:alquran_app/app/data/models/detail_surah.dart'
    as detail; // Sesuaikan dengan file model detail_surah.dart kamu

class DetailSurahController extends GetxController {
  // Fungsi untuk ambil detail surah berdasarkan id/nomor surah
  Future<detail.DetailSurah?> getDetailSurah(String id) async {
    Uri url = Uri.parse("https://quran-api.santrikoding.com/api/surah/$id");

    try {
      var response = await http.get(url);

      // Debugging log sederhana
      print('Request ke: $url');
      print('Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        // Decode JSON response ke dalam object DetailSurah
        var data = json.decode(response.body);
        var detailSurah = detail.DetailSurah.fromJson(data);

        // Cek apakah datanya valid
        if (detailSurah.namaLatin.isEmpty) {
          print("Data surah tidak lengkap!");
          return null;
        }

        return detailSurah;
      } else {
        print('Gagal fetch data! Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Terjadi error saat ambil data: $e');
      return null;
    }
  }
}
