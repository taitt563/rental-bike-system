import 'package:bike_rental_online/presentation/controllers/auth_controller.dart';
import 'package:bike_rental_online/presentation/controllers/dashboard_controller.dart';
import 'package:bike_rental_online/presentation/routes/app_routes.dart';
import 'package:bike_rental_online/presentation/screens/bookmarks/bookmark_screen.dart';
import 'package:bike_rental_online/presentation/screens/home/home_screen.dart';
import 'package:bike_rental_online/presentation/screens/mailbox/mailbox_screen.dart';
import 'package:bike_rental_online/presentation/screens/navigation/custom_animated_bottom_bar.dart';
import 'package:bike_rental_online/presentation/screens/settings/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final _inactiveColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomeScreen(),
                BookmarkScreen(),
                MailboxScreen(),
                SettingsScreen(),
              ],
            ),
          ),
          bottomNavigationBar: CustomAnimatedBottomBar(
            containerHeight: 70,
            backgroundColor: Colors.white,
            selectedIndex: controller.tabIndex,
            showElevation: true,
            itemCornerRadius: 24,
            curve: Curves.easeIn,
            onItemSelected: controller.changeTabIndex,
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/icons8-home.svg',
                  height: 24, // Chiều cao của biểu tượng
                  width: 24, // Chiều rộng của biểu tượng
                  color: _inactiveColor,
                ),
                title: Text('Home'),
                activeColor: Colors.green,
                inactiveColor: _inactiveColor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/icons8-bookmark.svg',
                  height: 24, // Chiều cao của biểu tượng
                  width: 24, // Chiều rộng của biểu tượng
                  color: _inactiveColor, // Màu sắc của biểu tượng
                ),
                title: Text('Bookmark'),
                activeColor: Colors.purpleAccent,
                inactiveColor: _inactiveColor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/icons8-mailbox.svg',
                  height: 24, // Chiều cao của biểu tượng
                  width: 24, // Chiều rộng của biểu tượng
                  color: _inactiveColor,
                ),
                title: Text(
                  'Messages',
                ),
                activeColor: Colors.pink,
                inactiveColor: _inactiveColor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/icons8-puzzle.svg',
                  height: 24, // Chiều cao của biểu tượng
                  width: 24,
                  color: _inactiveColor, // Chiều rộng của biểu tượng
                ),
                title: Text('Settings'),
                activeColor: Colors.blue,
                inactiveColor: _inactiveColor,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }

  // Widget _buildBottomBar() {
  //   return
  // }

  // Widget getBody() {
  //   List<Widget> pages = [
  //     HomeScreen(),
  //     BookmarkScreen(),
  //     MailboxScreen(),
  //     SettingsScreen()
  //   ];
  //   return IndexedStack(
  //     index: _currentIndex,
  //     children: pages,
  //   );
  // }
}
