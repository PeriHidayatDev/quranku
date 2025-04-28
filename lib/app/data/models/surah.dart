import 'dart:convert';

/// Fungsi untuk parse JSON string ke dalam List<Surah>
List<Surah> surahFromJson(String str) =>
    List<Surah>.from(json.decode(str).map((x) => Surah.fromJson(x)));

/// Fungsi untuk convert List<Surah> menjadi JSON string
String surahToJson(List<Surah> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// Model Data Surah
class Surah {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final String deskripsi;
  final String audio;

  Surah({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audio,
  });

  /// Factory constructor untuk membuat object dari JSON
  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        nomor: json["nomor"] ?? 0,
        nama: json["nama"] ?? '',
        namaLatin: json["nama_latin"] ?? '',
        jumlahAyat: json["jumlah_ayat"] ?? 0,
        tempatTurun: json["tempat_turun"] ?? '',
        arti: json["arti"] ?? '',
        deskripsi: json["deskripsi"] ?? '',
        audio: json["audio"] ?? '',
      );

  /// Convert object ke bentuk JSON
  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "nama_latin": namaLatin,
        "jumlah_ayat": jumlahAyat,
        "tempat_turun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audio": audio,
      };

  /// Fungsi copyWith untuk memudahkan perubahan sebagian properti
  Surah copyWith({
    int? nomor,
    String? nama,
    String? namaLatin,
    int? jumlahAyat,
    String? tempatTurun,
    String? arti,
    String? deskripsi,
    String? audio,
  }) {
    return Surah(
      nomor: nomor ?? this.nomor,
      nama: nama ?? this.nama,
      namaLatin: namaLatin ?? this.namaLatin,
      jumlahAyat: jumlahAyat ?? this.jumlahAyat,
      tempatTurun: tempatTurun ?? this.tempatTurun,
      arti: arti ?? this.arti,
      deskripsi: deskripsi ?? this.deskripsi,
      audio: audio ?? this.audio,
    );
  }
}
