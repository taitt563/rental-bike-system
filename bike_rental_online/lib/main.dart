import 'package:bike_rental_online/app.dart';
import 'package:bike_rental_online/core/utils/dependency.dart';
import 'package:bike_rental_online/firebase_options.dart';
import 'package:bike_rental_online/presentation/controllers/home_controller.dart';
import 'package:bike_rental_online/presentation/controllers/order_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Dependency.init();
  Get.lazyPut<HomeController>(() => HomeController());
  Get.put<OrderController>(OrderController());
  runApp(MyApp());
}
