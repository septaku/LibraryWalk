import 'package:librarywalk/app/components/bookSearch.dart';
import 'package:librarywalk/app/components/buildSearch.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:librarywalk/app/components/searchInput.dart';

import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    final heightFullBody = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: controller.obx(
        (state) => Container(
          color: const Color(0xFFFFFFFF),
          width: width,
          height: heightFullBody,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyInputSearch(
                    prefixIcon: Icons.search,
                    validator: controller.validator,
                    controller: controller,
                    controllerField: controller.search,
                    height: 10,
                    textAlign: TextAlign.center,
                    width: 10,
                    hintText: "Search For Your Book",
                    autoFocus: false,
                  ),
                ),
                Obx(
                  () => Expanded(
                    child: controller.searchLenght.value == 1
                        ? controller.loading.value == false ? controller.listDataBuku.isEmpty ? const Center(child: Text("Tidak Ada Buku")) : BookSearch(data: controller.listDataBuku) : const Center(child: CircularProgressIndicator())
                        : buildSearch(data: state!),
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
