import 'package:bike_rental_online/presentation/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  SplashController controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    controller.moveToSignInPage();
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash Screen'),
      ),
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
