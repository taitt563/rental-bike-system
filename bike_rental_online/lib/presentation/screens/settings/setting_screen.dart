import 'package:bike_rental_online/presentation/controllers/auth_controller.dart';
import 'package:bike_rental_online/presentation/screens/components/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBarWidget(
          scaffoldKey: scaffoldKey, title: "Settings", showDrawer: false),
      body: ListView(
        children: [
          ListTile(
            title: Text("Account Settings"),
            onTap: () {
              // Xử lý khi người dùng chọn "Account Settings"
            },
          ),
          ListTile(
            title: Text("Notification Settings"),
            onTap: () {
              // Xử lý khi người dùng chọn "Notification Settings"
            },
          ),
          ListTile(
            title: Text("Privacy Settings"),
            onTap: () {
              // Xử lý khi người dùng chọn "Privacy Settings"
            },
          ),
          ListTile(
            title: Text("Log Out"),
            onTap: () {
              authController.logoutAndReset();
            },
          ),
        ],
      ),
    );
  }
}
