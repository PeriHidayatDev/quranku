// Model Audio untuk properti audio di ayat
class Audio {
  final String? primary;

  Audio({this.primary});

  factory Audio.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Audio(primary: null);
    return Audio(primary: json['primary'] as String?);
  }

  Map<String, dynamic> toJson() => {
        "primary": primary,
      };
}

// Model Ayat dengan tambahan audio
class Ayat {
  final int nomorAyat;
  final String teksArab;
  final String teksLatin;
  final String teksIndonesia;
  final Audio audio; // tambahkan ini

  Ayat({
    required this.nomorAyat,
    required this.teksArab,
    required this.teksLatin,
    required this.teksIndonesia,
    required this.audio, // tambahkan ini juga di constructor
  });

  factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        nomorAyat: json["nomor"] ?? 0,
        teksArab: json["ar"] ?? "",
        teksLatin: json["tr"] ?? "",
        teksIndonesia: json["idn"] ?? "",
        audio: Audio.fromJson(json["audio"] as Map<String, dynamic>?),
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomorAyat,
        "ar": teksArab,
        "tr": teksLatin,
        "idn": teksIndonesia,
        "audio": audio.toJson(),
      };
}

// Model DetailSurah tetap sama
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

  factory DetailSurah.fromJson(Map<String, dynamic> json) => DetailSurah(
        namaLatin: json["nama_latin"] ?? "",
        arti: json["arti"] ?? "",
        jumlahAyat: json["jumlah_ayat"] ?? 0,
        tempatTurun: json["tempat_turun"] ?? "",
        ayat: json["ayat"] == null
            ? []
            : List<Ayat>.from(json["ayat"].map((x) => Ayat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nama_latin": namaLatin,
        "arti": arti,
        "jumlah_ayat": jumlahAyat,
        "tempat_turun": tempatTurun,
        "ayat": List<dynamic>.from(ayat.map((x) => x.toJson())),
      };
}
