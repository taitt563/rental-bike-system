import 'dart:async';

import 'package:bike_rental_online/presentation/controllers/auth_controller.dart';
import 'package:bike_rental_online/presentation/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashController extends GetxController {
  RxBool isLoggedIn = false.obs;

  Future<void> checkLoginStatus() async {
    // Xử lý logic đăng nhập, ví dụ:
    bool isUserLoggedIn = await checkIfUserIsLoggedIn();

    if (isUserLoggedIn) {
      isLoggedIn.value = true;
    } else {
      isLoggedIn.value = false;
    }
  }

  Future<bool> checkIfUserIsLoggedIn() async {
    bool isLoggedIn = false;

    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // User đã đăng nhập
        isLoggedIn = true;
      } else {
        // User chưa đăng nhập
        isLoggedIn = false;
      }
    } catch (e) {
      // Xử lý lỗi khi kiểm tra đăng nhập
      print('Error checking login status: $e');
    }

    return isLoggedIn;
  }

  void redirectBasedOnLoginStatus() {
    checkLoginStatus().then((_) {
      if (isLoggedIn.value) {
        Future.delayed(
          Duration(seconds: 3),
          () {
            Get.offAllNamed(AppRoutes.Dashboard);
          },
        );
        // Chuyển hướng đến HomeScreen nếu đã đăng nhập
      } else {
        Future.delayed(
          Duration(seconds: 3),
          () {
            Get.offAllNamed(AppRoutes.Signin);
          },
        ); // Chuyển hướng đến LoginScreen nếu chưa đăng nhập
      }
    });
  }
}
