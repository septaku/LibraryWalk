import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:librarywalk/app/routes/app_pages.dart';

import '../controllers/homescreen_controller.dart';

class HomescreenView extends GetView<HomescreenController> {
  const HomescreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color(0XFF379FD0),
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/logo-smk.png"),
                  Image.asset("assets/images/logo.png")
                ],
              ),
              Expanded(flex: 3,child: Image.asset('assets/images/animasi.png')),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Text(
                'SELAMAT DATANG DI \n PERPUSTAKAAN DIGITAL \n LIBRARY WALK',
                style: TextStyle(fontSize: 30, fontFamily: GoogleFonts.baloo2(fontWeight: FontWeight.w900).fontFamily, color: Colors.white,height: 1.2), 
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                'Perpustakaan Digital merupakan aplikasi perpustakaan yang menyewakan buku berbasis mobile.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w100).fontFamily, color: Colors.white,height: 1.2),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              ElevatedButton(
                onPressed: () {Get.offAllNamed(Routes.LOGIN);},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5B5D67),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.01),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.2,
                      vertical: MediaQuery.of(context).size.height * 0.015),
                ),
                child: Text('GET STARTED',style: TextStyle(fontFamily: GoogleFonts.baloo2(fontWeight: FontWeight.bold).fontFamily)),
              ),
              const Expanded(flex: 1, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
