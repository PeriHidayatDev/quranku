import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:alquran_app/app/data/models/surah.dart'; // pastikan path sudah sesuai

class HomeController extends GetxController {
  RxBool isDark = false.obs;

  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse("https://quran-api.santrikoding.com/api/surah");

    try {
      var res = await http.get(url);

      if (res.statusCode == 200) {
        // Decode JSON dari response
        var data = json.decode(res.body);

        // Parsing semua data menjadi List<Surah>
        List<Surah> semuaSurah = List<Surah>.from(
          data.map((item) => Surah.fromJson(item)),
        );

        // Menampilkan semua daftar surah di console
        semuaSurah.forEach(
          (surah) {
            print('Nomor : ${surah.nomor}');
            print('Nama : ${surah.nama}');
            print('Nama Latin : ${surah.namaLatin}');
            print('Jumlah Ayat : ${surah.jumlahAyat}');
            print('Tempat Turun : ${surah.tempatTurun}');
            print('Deskripsi : ${surah.deskripsi}');
            print('Audio : ${surah.audio}');
          },
        );

        return semuaSurah;
      } else {
        print('Gagal fetch data! Status code: ${res.statusCode}');
        return [];
      }
    } catch (e) {
      print('Terjadi error saat ambil data: $e');
      return [];
    }
  }
}
