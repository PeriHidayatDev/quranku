import 'package:alquran_app/app/constant/color.dart';
import 'package:alquran_app/app/data/models/detail_surah.dart' as detail;
import 'package:alquran_app/app/data/models/surah.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  DetailSurahView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Surah surah = Get.arguments as Surah;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SURAH ${surah.namaLatin.toUpperCase()}',
          style: TextStyle(
            color: appWhite,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<detail.DetailSurah?>(
        future: controller.getDetailSurah(surah.nomor.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text("Tidak ada data ayat."));
          }

          var detailSurah = snapshot.data!;
          var ayatList = detailSurah.ayat;

          return ListView(
            padding: EdgeInsets.all(20),
            children: [
              GestureDetector(
                onTap: () => Get.defaultDialog(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  title: "Tafsir ${surah.namaLatin}",
                  titleStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  content: Container(
                    child: Text(
                      "${surah.deskripsi}",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        appPurpleLight1,
                        appPurpleDark,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          detailSurah.namaLatin.toUpperCase(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: appWhite,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          detailSurah.arti.toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: appWhite,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "${detailSurah.jumlahAyat} Ayat | ${detailSurah.tempatTurun}",
                          style: TextStyle(
                            fontSize: 16,
                            color: appWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ListView.builder(
                itemCount: ayatList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var ayat = ayatList[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Bagian Atas: Nomor & Tombol
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: appPurpleLight2.withOpacity(0.3),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blueAccent,
                                child: Text(
                                  "${ayat.nomorAyat}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      // Bookmark handler
                                    },
                                    icon: Icon(Icons.bookmark_add_outlined),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      // Play audio handler
                                    },
                                    icon: Icon(Icons.play_arrow),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Teks Arab
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          ayat.teksArab,
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      // Terjemahan Indonesia
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          ayat.teksIndonesia,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
