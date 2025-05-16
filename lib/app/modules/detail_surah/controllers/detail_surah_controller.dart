import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:alquran_app/app/data/models/detail_surah.dart' as detail;
import 'package:just_audio/just_audio.dart';

class DetailSurahController extends GetxController {
  final player = AudioPlayer();

  // Fungsi untuk ambil detail surah berdasarkan ID
  Future<detail.DetailSurah?> getDetailSurah(String id) async {
    Uri url = Uri.parse("https://quran-api.santrikoding.com/api/surah/$id");

    try {
      var response = await http.get(url);

      print('Request ke: $url');
      print('Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var detailSurah = detail.DetailSurah.fromJson(data);

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

  // Fungsi untuk memutar audio
  void playAudio(String? url) async {
    if (url != null) {
      try {
        // Hentikan audio sebelumnya jika ada
        await player.setUrl(url);
        await player.play();
      } on PlayerException catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: e.message.toString(),
        );
      } on PlayerInterruptedException catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Koneksi terganggu: ${e.message}",
        );
      } catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Tidak dapat memutar audio.",
        );
      }
    } else {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "URL audio tidak tersedia atau tidak valid.",
      );
    }
  }

  @override
  void onClose() {
    player.stop();
    player.dispose(); // Bersihkan resource audio saat controller ditutup
    super.onClose();
  }
}
