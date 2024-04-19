import 'package:get/get.dart';
import 'package:librarywalk/app/modules/book/controllers/book_controller.dart';
import 'package:librarywalk/app/modules/bookmark/bindings/bookmark_binding.dart';
import 'package:librarywalk/app/modules/bookmark/controllers/bookmark_controller.dart';
import 'package:librarywalk/app/modules/history/controllers/history_controller.dart';
import 'package:librarywalk/app/modules/home/controllers/home_controller.dart';
import 'package:librarywalk/app/modules/profil/controllers/profil_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<BookController>(
      () => BookController(),
    );
    Get.lazyPut<BookmarkController>(
      () => BookmarkController(),
    );
    Get.lazyPut<HistoryController>(
      () => HistoryController(),
    );
    Get.lazyPut<ProfilController>(
      () => ProfilController(),
    );
  }
}
