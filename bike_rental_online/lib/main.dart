import 'package:bike_rental_online/app.dart';
import 'package:bike_rental_online/core/utils/dependency.dart';
import 'package:bike_rental_online/domain/repositories/post_repository.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Dependency.init();
  runApp(const MyApp());
}
