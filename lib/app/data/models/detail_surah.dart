import 'dart:convert';

// Parsing dari JSON string ke DetailSurah object
DetailSurah detailSurahFromJson(String str) =>
    DetailSurah.fromJson(json.decode(str));

// Parsing dari DetailSurah object ke JSON string
String detailSurahToJson(DetailSurah data) => json.encode(data.toJson());

// Model DetailSurah
class DetailSurah {
  final String namaLatin;
  final String arti;
  final int jumlahAyat;
  final String tempatTurun;
  final List<Ayat> ayat;

  DetailSurah({
    required this.namaLatin,
    required this.arti,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.ayat,
  });

  // Factory untuk parsing dari JSON
  factory DetailSurah.fromJson(Map<String, dynamic> json) => DetailSurah(
        namaLatin: json["nama_latin"] ?? "",
        arti: json["arti"] ?? "",
        jumlahAyat: json["jumlah_ayat"] ?? 0,
        tempatTurun: json["tempat_turun"] ?? "",
        ayat: json["ayat"] == null
            ? []
            : List<Ayat>.from(json["ayat"].map((x) => Ayat.fromJson(x))),
      );

  // Convert object DetailSurah ke JSON Map
  Map<String, dynamic> toJson() => {
        "nama_latin": namaLatin,
        "arti": arti,
        "jumlah_ayat": jumlahAyat,
        "tempat_turun": tempatTurun,
        "ayat": List<dynamic>.from(ayat.map((x) => x.toJson())),
      };
}

// Model Ayat
class Ayat {
  final int nomorAyat;
  final String teksArab;
  final String teksLatin;
  final String teksIndonesia;

  Ayat({
    required this.nomorAyat,
    required this.teksArab,
    required this.teksLatin,
    required this.teksIndonesia,
  });

  // Factory untuk parsing dari JSON
  factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        nomorAyat: json["nomor"] ?? 0,
        teksArab: json["ar"] ?? "",
        teksLatin: json["tr"] ?? "",
        teksIndonesia: json["idn"] ?? "",
      );

  // Convert object Ayat ke JSON Map
  Map<String, dynamic> toJson() => {
        "nomor": nomorAyat,
        "ar": teksArab,
        "tr": teksLatin,
        "idn": teksIndonesia,
      };
}
