import 'package:bike_rental_online/presentation/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  SplashController _splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    _splashController.redirectBasedOnLoginStatus();
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 100.0,
                height: 100.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Sbike',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF7643),
                fontFamily: 'assets/fonts/muli/Muli-Semi-BoldItalic.ttf',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
