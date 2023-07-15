import 'package:flutter/material.dart';

Widget buildDrawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Navigation Drawer',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        ListTile(
          title: Text('Item 1'),
          onTap: () {
            // Xử lý khi người dùng chọn Item 1 trong drawer
          },
        ),
        ListTile(
          title: Text('Item 2'),
          onTap: () {
            // Xử lý khi người dùng chọn Item 2 trong drawer
          },
        ),
        // Thêm các ListTile khác tương tự
      ],
    ),
  );
}
