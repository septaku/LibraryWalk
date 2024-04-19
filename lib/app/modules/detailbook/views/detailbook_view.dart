import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:librarywalk/app/components/bookDetails.dart';
import 'package:librarywalk/app/routes/app_pages.dart';

import '../controllers/detailbook_controller.dart';

class DetailbookView extends GetView<DetailbookController> {
  const DetailbookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.obx(
      (state) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(state!.state1!.coverBuku.toString()),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.4), BlendMode.modulate),
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 30,
                left: 20,
                right: 0,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back),
                      Text(
                        "Back",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily:
                                GoogleFonts.poppins(fontWeight: FontWeight.w500)
                                    .fontFamily,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 100,
                  left: 0,
                  right: 0,
                  child: MyBookDetails(dataBookDetails: state.state1!)),
              Positioned(
                bottom: 10,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 90,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(Routes.PINJAM);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF000000),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * 0.01),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.2,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.012),
                          ),
                          child: Text('PINJAM BUKU',
                              style: TextStyle(
                                fontSize: 30,
                                  fontFamily: GoogleFonts.baloo2(
                                          fontWeight: FontWeight.bold)
                                      .fontFamily)),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: ()=>controller.addKoleksiBuku(),
                          child: Obx(
                            () => Icon(
                              Icons.bookmark,
                              size: 30,
                              color: controller.detailBuku.value.koleksi == true ? Colors.green : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
