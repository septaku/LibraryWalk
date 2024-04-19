import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:librarywalk/app/components/starRating.dart';
import 'package:librarywalk/app/data/models/response_bookPopular.dart';

class BookRekomendasi extends StatelessWidget {
  const BookRekomendasi({
    super.key,
    required this.dataBookPopular,
  });

  final List<DataBookPopular> dataBookPopular;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
          children: dataBookPopular
              .map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0XFFFFFFFF),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(
                                  1, 1), // changes position of shadow
                            ),
                          ]),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                              child: Image.network(
                                e.coverBuku.toString(),
                                height: MediaQuery.of(context).size.height * 0.3,
                                fit: BoxFit.fitWidth,
                                width: double.infinity,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    maxLines: 1,
                                    e.judul.toString(),
                                    style: TextStyle(
                                      height: 1.2,
                                      fontWeight: FontWeight.w900,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontSize: 12.0,
                                      color: const Color(0XFF000000),
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01),
                                  StarRating(
                                    rating: e.rating!.toDouble(),
                                    starSize: 17,
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01),
                                  Text(
                                    maxLines: 3,
                                    e.deskripsi.toString(),
                                    style: TextStyle(
                                      height: 1.2,
                                      fontWeight: FontWeight.w500,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontSize: 12.0,
                                      color: const Color(0XFF000000),
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ))
              .toList()),
    );
  }
}
