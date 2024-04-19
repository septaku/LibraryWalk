import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:librarywalk/app/components/bookNew.dart';
import 'package:librarywalk/app/components/bookRekomendasi.dart';
import 'package:librarywalk/app/components/myInput.dart';
import 'package:librarywalk/app/components/navProfil.dart';
import 'package:librarywalk/app/data/constans/constans.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final heightFullBody =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final widthFullBody = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: kPrimaryColor,
        width: widthFullBody,
        height: heightFullBody,
        // width: widthFullBody,
        child: controller.obx(
          (state) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NavProfil(
                  title: "Welcome",
                  image: "assets/images/profil.png",
                  icon: FontAwesomeIcons.bell,
                  subtitle: controller.username.value.toString(),
                ),
                SizedBox(
                  height: heightFullBody * 0.04,
                ),
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: widthFullBody * 0.05),
                    child: myInput(
                      controller: controller,
                      controllerField: controller.search,
                      hintText: "Search for books",
                      autoFocus: true,
                      textAlign: TextAlign.center,
                      prefixIcon: FontAwesomeIcons.searchengin,
                    )),
                SizedBox(
                  height: heightFullBody * 0.04,
                ),
                BookNew(dataBookNew: state!.state1!),
                SizedBox(
                  height: heightFullBody * 0.06,
                ),
                Container(
                  decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rekomendasi",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily:
                              GoogleFonts.poppins(fontWeight: FontWeight.w400)
                                  .fontFamily,
                          fontSize: 25.0,
                          color: const Color(0xFF000000),
                        ),
                      ),
                      SizedBox(height: heightFullBody * 0.02,),
                      BookRekomendasi(dataBookPopular: state.state2!)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
