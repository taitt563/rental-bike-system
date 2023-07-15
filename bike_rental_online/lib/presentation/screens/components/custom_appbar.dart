import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String? title;
  final bool showDrawer;

  AppBarWidget({required this.scaffoldKey, this.title, this.showDrawer = true});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      bottom: PreferredSize(
        child: Container(
          height: 1.0,
          color: Colors.grey.withOpacity(0.5),
        ),
        preferredSize: Size.fromHeight(1.0),
      ),
      title: showDrawer
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      title ?? "Unknown Title",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: Text(
                title ?? "Unknown Title",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
      automaticallyImplyLeading: false,
      actions: showDrawer
          ? [
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  scaffoldKey.currentState!.openEndDrawer();
                },
              ),
            ]
          : null,
    );
  }
}
