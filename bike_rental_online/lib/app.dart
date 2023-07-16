import 'package:bike_rental_online/presentation/routes/app_pages.dart';
import 'package:bike_rental_online/presentation/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bike Rental Online',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      theme: ThemeData(
        primaryColor: Colors.white, // Chỉnh màu chính của app

        useMaterial3: true,
      ),
      initialRoute: AppRoutes.Splash,
      defaultGlobalState: true,
      enableLog: true,
      getPages: AppPages.pages,
    );
  }
}
