import 'package:bike_rental_online/presentation/controllers/auth_controller.dart';
import 'package:bike_rental_online/presentation/screens/components/custom_appbar.dart';
import 'package:bike_rental_online/presentation/screens/profile/profile_screen.dart';
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
        scaffoldKey: scaffoldKey,
        title: "Cài đặt",
        showDrawer: false,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Account Settings"),
            onTap: () {
              Get.to(() => ProfileScreen());
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications_none_outlined),
            title: Text("Notification Settings"),
            onTap: () {
              // Handle when the user selects "Notification Settings"
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text("Privacy Settings"),
            onTap: () {
              // Handle when the user selects "Privacy Settings"
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
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
