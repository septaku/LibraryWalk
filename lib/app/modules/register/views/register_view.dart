import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:librarywalk/app/components/myInput.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final widthfullbody = MediaQuery.of(context).size.width;
    final heightfullbody = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: widthfullbody * 0.1,
                vertical: heightfullbody * 0.05),
            width: widthfullbody,
            height: heightfullbody,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg.png"),
                    fit: BoxFit.fill)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ColoredBox(
                color: const Color(0xFF2F596F),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: heightfullbody * 0.02,
                    ),
                    Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily:
                                GoogleFonts.baloo2(fontWeight: FontWeight.bold)
                                    .fontFamily,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: heightfullbody * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        "FirstName",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: GoogleFonts.baloo2(
                                    fontWeight: FontWeight.normal)
                                .fontFamily,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: myInput(
                        validator: controller.validatorEmail,
                        controller: controller,
                        controllerField: controller.firstname,
                        hintText: "FirstName",
                        prefixIcon: FontAwesomeIcons.user,
                        autoFocus: true,
                      ),
                    ),
                    SizedBox(
                      height: heightfullbody * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        "LastName",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: GoogleFonts.baloo2(
                                    fontWeight: FontWeight.normal)
                                .fontFamily,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: myInput(
                        validator: controller.validatorEmail,
                        controller: controller,
                        controllerField: controller.lastname,
                        hintText: "LastName",
                        prefixIcon: FontAwesomeIcons.user,
                      ),
                    ),
                    SizedBox(
                      height: heightfullbody * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        "Username",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: GoogleFonts.baloo2(
                                    fontWeight: FontWeight.normal)
                                .fontFamily,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: myInput(
                        validator: controller.validatorEmail,
                        controller: controller,
                        controllerField: controller.username,
                        hintText: "Username",
                        prefixIcon: FontAwesomeIcons.user,
                      ),
                    ),
                    SizedBox(
                      height: heightfullbody * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: GoogleFonts.baloo2(
                                    fontWeight: FontWeight.normal)
                                .fontFamily,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: myInput(
                        validator: controller.validator,
                        controller: controller,
                        controllerField: controller.email,
                        hintText: "Email",
                        prefixIcon: FontAwesomeIcons.user,
                      ),
                    ),
                    SizedBox(
                      height: heightfullbody * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: GoogleFonts.baloo2(
                                    fontWeight: FontWeight.normal)
                                .fontFamily,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: myInput(
                        validator: controller.validatorPassword,
                        controller: controller,
                        controllerField: controller.password,
                        hintText: "Password",
                        isPassword: true,
                        prefixIcon: FontAwesomeIcons.key,
                      ),
                    ),
                    SizedBox(
                      height: heightfullbody * 0.02,
                    ),
                    Center(
                      child: Obx(
                        () => ElevatedButton(
                          onPressed: () {
                            controller.postRegister();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF36A9E0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * 0.01),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.2,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.015),
                          ),
                          child: controller.loading.value? const CircularProgressIndicator():Text('REGISTER',
                              style: TextStyle(
                                  fontFamily: GoogleFonts.baloo2(
                                          fontWeight: FontWeight.bold)
                                      .fontFamily)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
