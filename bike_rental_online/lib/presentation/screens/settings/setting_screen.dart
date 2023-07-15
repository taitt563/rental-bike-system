import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
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
              // Xử lý khi người dùng chọn "Log Out"
              // Đăng xuất người dùng và chuyển về màn hình đăng nhập hoặc màn hình khác tùy thuộc vào luồng ứng dụng của bạn.
            },
          ),
        ],
      ),
    );
  }
}
