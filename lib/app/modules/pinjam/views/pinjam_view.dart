import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:librarywalk/app/data/provider/storage_provider.dart';
import '../controllers/pinjam_controller.dart';

class PinjamView extends GetView<PinjamController> {
  const PinjamView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: Obx(
            () => Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 1,
              decoration: const BoxDecoration(color: Colors.white),
              child: AnimatedCrossFade(
                duration: const Duration(milliseconds: 1000),
                firstChild: MyPinjam(
                  controller: controller,
                ),
                secondChild: MyPinjamTrue(controller: controller),
                crossFadeState: controller.sucsesPeminjaman.value == false
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyPinjam extends StatelessWidget {
  const MyPinjam({super.key, required this.controller});
  final PinjamController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 50,
                color: const Color(0xFF379FD0),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "FORM PEMINJAMAN BUKU",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        overflow: TextOverflow.visible,
                        fontFamily:
                            GoogleFonts.poppins(fontWeight: FontWeight.w600)
                                .fontFamily,
                        fontSize: 17.0,
                        color: const Color(0xFFFFFFFF),
                      ),
                    )
                  ],
                ),
              ),
            )),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox.expand(
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: () {
                          controller.addPinjam();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0XFF36969d),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.000000),
                          ),
                        ),
                        child: controller.loading.value
                            ? const CircularProgressIndicator()
                            : Text(
                                'PINJAM',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: GoogleFonts.baloo2(
                                            fontWeight: FontWeight.bold)
                                        .fontFamily),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          top: 70,
          left: 20,
          right: 20,
          bottom: 50,
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Expanded(
                child: Container(
                  color: Colors.grey,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Judul Buku",
                            style: GoogleFonts.inriaSans(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16.0),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            readOnly: true,
                            initialValue: controller.detailbookController.detailBuku.value.judulBuku.toString(),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              isDense: true,
                              suffixIcon: const Icon(Icons.book),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Color(0xFF00D193)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Color(0xFF00D193)),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nama",
                            style: GoogleFonts.inriaSans(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16.0),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            readOnly: true,
                            initialValue:
                                StorageProvider.read(StorageKey.username),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              isDense: true,
                              suffixIcon: const Icon(Icons.people),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Color(0xFF00D193)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Color(0xFF00D193)),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tanggal Pinjam",
                            style: GoogleFonts.inriaSans(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16.0),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              isDense: true,
                              suffixIcon: const Icon(Icons.date_range),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Color(0xFF00D193)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Color(0xFF00D193)),
                              ),
                            ),
                            initialValue: "${controller.day} - ${controller.month} - ${controller.year}",
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tanggal Kembali",
                            style: GoogleFonts.inriaSans(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16.0),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              isDense: true,
                              suffixIcon: const Icon(Icons.date_range),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Color(0xFF00D193)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Color(0xFF00D193)),
                              ),
                            ),
                            initialValue:
                                "${controller.dayAfter} - ${controller.monthAfter} - ${controller.yearAfter}",
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class MyPinjamTrue extends StatelessWidget {
  const MyPinjamTrue({super.key, required this.controller});
  final PinjamController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox.expand(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFF36969d),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.000000),
                        ),
                      ),
                      child: Text(
                        'Kembali ke Halaman Buku',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily:
                                GoogleFonts.baloo2(fontWeight: FontWeight.bold)
                                    .fontFamily),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          top: 0,
          left: 20,
          right: 20,
          bottom: 50,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Icon(
                Icons.check_circle_outline_sharp,
                color: Color(0XFF36969d),
                size: 130,
              ),
              Text(
                "Peminjaman\nBerhasil",
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  overflow: TextOverflow.visible,
                  fontFamily: GoogleFonts.audiowide(fontWeight: FontWeight.w800)
                      .fontFamily,
                  fontSize: 32.0,
                  color: const Color(0xFF000000),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    controller.detailbookController.detailBuku.value.coverBuku
                        .toString(),
                    height: 130,
                  )),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  controller.detailbookController.detailBuku.value.judulBuku
                      .toString(),
                  overflow: TextOverflow.visible,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    overflow: TextOverflow.visible,
                    fontFamily:
                        GoogleFonts.audiowide(fontWeight: FontWeight.w600)
                            .fontFamily,
                    fontSize: 27.0,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
              Center(
                child: Text(
                  controller.detailbookController.detailBuku.value.penulisBuku
                      .toString(),
                  overflow: TextOverflow.visible,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.visible,
                    fontFamily:
                        GoogleFonts.audiowide(fontWeight: FontWeight.w600)
                            .fontFamily,
                    fontSize: 20.0,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "${controller.detailbookController.detailBuku.value.penerbitBuku.toString()} / ${controller.detailbookController.detailBuku.value.tahunTerbit.toString()}",
                  overflow: TextOverflow.visible,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.visible,
                    fontFamily:
                        GoogleFonts.audiowide(fontWeight: FontWeight.w600)
                            .fontFamily,
                    fontSize: 20.0,
                    color: const Color.fromARGB(255, 127, 127, 127),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xFF888989),
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "${controller.day.toString()}/${controller.month.toString()}/${controller.year.toString()} - ${controller.dayAfter.toString()}/${controller.monthAfter.toString()}/${controller.yearAfter.toString()}",
                  overflow: TextOverflow.visible,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.visible,
                    fontFamily:
                        GoogleFonts.audiowide(fontWeight: FontWeight.w600)
                            .fontFamily,
                    fontSize: 20.0,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              Text(
                "Terima Kasih telah meminjam ! \n Selamat Membaca",
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  overflow: TextOverflow.visible,
                  fontFamily: GoogleFonts.audiowide(fontWeight: FontWeight.w800)
                      .fontFamily,
                  fontSize: 17.0,
                  color: const Color(0xFF000000),
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ],
    );
  }
}
