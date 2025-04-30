import 'package:alquran_app/app/data/models/detail_surah.dart';
// import 'package:alquran_app/app/data/models/surah.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:alquran_app/data/models/surah.dart'; // Pastikan path file-nya sesuai

void main() async {
  Future<DetailSurah?> getDetailSurah(String id) async {
    Uri url = Uri.parse("https://quran-api.santrikoding.com/api/surah/$id");
    var res = await http.get(url);

    if (res.statusCode == 200) {
      final jsonResult = json.decode(res.body);
      final data = jsonResult["data"];

      if (data != null && data is Map<String, dynamic>) {
        DetailSurah detailSurah = DetailSurah.fromJson(data);
        print(detailSurah);
        return detailSurah;
      } else {
        print("Data kosong atau tidak sesuai format");
        return null;
      }
    } else {
      print("Gagal mengambil data: ${res.statusCode}");
      return null;
    }
  }

  await getDetailSurah("1");
  // Uri url = Uri.parse("https://quran-api.santrikoding.com/api/surah");

  // try {
  //   var res = await http.get(url);

  //   if (res.statusCode == 200) {
  //     var data = json.decode(res.body);

  //     // Parsing semua data menjadi List<Surah>
  //     List<Surah> semuaSurah = List<Surah>.from(
  //       data.map((item) => Surah.fromJson(item)),
  //     );

  //     // Ambil Surah An-Nas (index ke-113)
  //     Surah surahAnnas = semuaSurah[113];

  //     // Munculin data ke console
  //     // print('Nomor Surah   : ${surahAnnas.nomor}');
  //     print('Nama Surah    : ${surahAnnas.nama}');
  //     // print('Nama Latin    : ${surahAnnas.namaLatin}');
  //     // print('Jumlah Ayat   : ${surahAnnas.jumlahAyat}');
  //     // print('Tempat Turun  : ${surahAnnas.tempatTurun}');
  //     // print('Deskripsi     : ${surahAnnas.deskripsi}');
  //     // print('Audio         : ${surahAnnas.audio}');

  //     Uri urlAnnas = Uri.parse(
  //         "https://quran-api.santrikoding.com/api/surah/${surahAnnas.nomor}");
  //     var resAnnas = await http.get(url);

  //     // print(resAnnas.body);
  //   } else {
  //     print('Gagal fetch data! Status code: ${res.statusCode}');
  //   }
  // } catch (e) {
  //   print('Terjadi error saat ambil data: $e');
  // }
}
