import 'dart:async';

import 'package:bike_rental_online/presentation/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashController extends GetxController {
  moveToSignInPage() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      Get.toNamed(AppRoutes.PostsPage);
    });
  }
}
