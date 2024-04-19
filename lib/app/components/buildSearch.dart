import 'package:librarywalk/app/components/starRating.dart';
import 'package:librarywalk/app/data/models/response_buku.dart';
import 'package:flutter/material.dart';
import 'package:librarywalk/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class buildSearch extends StatelessWidget {
  const buildSearch({
    super.key,
    required this.data,
  });

  final List<DataBuku> data;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyBuku(data: data[index].buku!),
            const SizedBox(
              height: 10,
            )
          ],
        );
      },
    );
  }
}

class MyBuku extends StatelessWidget {
  const MyBuku({super.key, required this.data});
  final List<Buku> data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 1.3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 20),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Get.toNamed(Routes.DETAILBOOK,
                parameters: {"idbook": data[index].bukuID.toString()}),
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),),
                        child: Image.network(
                          data[index].coverBuku.toString(),
                          height:
                              MediaQuery.of(context).size.height * 0.2,
                          fit: BoxFit.fitWidth,
                          width: double.infinity,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height *
                              0.01),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              maxLines: 1,
                              data[index].judul.toString(),
                              style: TextStyle(
                                height: 1.2,
                                fontWeight: FontWeight.w900,
                                fontFamily:
                                    GoogleFonts.poppins().fontFamily,
                                fontSize: 20.0,
                                color: const Color(0XFF000000),
                              ),
                            ),
                            StarRating(
                              rating: data[index].rating!.toDouble(),
                              starSize: 17,
                              starColor: const Color(0xFFCBCE1B),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
