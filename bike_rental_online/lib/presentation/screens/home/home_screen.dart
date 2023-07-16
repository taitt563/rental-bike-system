import 'package:bike_rental_online/presentation/controllers/home_controller.dart';
import 'package:bike_rental_online/presentation/screens/components/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final HomeController _homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBarWidget(
          scaffoldKey: scaffoldKey,
          title: _homeController.title,
          showDrawer: false),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
