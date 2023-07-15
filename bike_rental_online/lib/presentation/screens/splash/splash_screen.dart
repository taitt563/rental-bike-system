import 'package:bike_rental_online/presentation/controllers/splash_controller.dart';
import 'package:bike_rental_online/presentation/routes/app_routes.dart';
import 'package:bike_rental_online/presentation/screens/components/custom_appbar.dart';
import 'package:bike_rental_online/presentation/screens/posts/posts_page.dart';
import 'package:bike_rental_online/presentation/screens/signin/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  SplashController _splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    _splashController.redirectBasedOnLoginStatus();
    return Scaffold(
      appBar: AppBarWidget(
          scaffoldKey: scaffoldKey, title: "SplashScreen", showDrawer: false),
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
