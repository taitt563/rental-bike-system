import 'package:bike_rental_online/app.dart';
import 'package:bike_rental_online/core/utils/dependency.dart';
import 'package:bike_rental_online/domain/repositories/post_repository.dart';
import 'package:bike_rental_online/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Dependency.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
