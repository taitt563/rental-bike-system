import 'package:bike_rental_online/presentation/controllers/posts_controller.dart';
import 'package:bike_rental_online/presentation/routes/app_routes.dart';
import 'package:bike_rental_online/presentation/screens/components/custom_appbar.dart';
import 'package:bike_rental_online/presentation/screens/components/custom_navigation_bar.dart';
import 'package:bike_rental_online/presentation/screens/components/custom_navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsPage extends StatefulWidget {
  PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final PostController _controller = Get.find<PostController>();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBarWidget(
          scaffoldKey: scaffoldKey, title: "Posts", showDrawer: false),
      endDrawer: buildDrawer(),
      bottomNavigationBar: CustomNavigationBar(
        iconPaths: [
          'assets/icons/icons8-home.svg',
          'assets/icons/icons8-bookmark.svg',
          'assets/icons/icons8-mailbox.svg',
          'assets/icons/icons8-puzzle.svg',
        ],
        selectedIconPaths: [
          'assets/icons/icons8-home.svg',
          'assets/icons/icons8-home.svg',
          'assets/icons/icons8-home.svg',
          'assets/icons/icons8-home.svg',
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 1) {
            Get.toNamed(AppRoutes.Bookmarks);
          }
          if (index == 2) {
            Get.toNamed(AppRoutes.Mailbox);
          }
          if (index == 3) {
            Get.toNamed(AppRoutes.Settings);
          }
        },
      ),
      body: Obx(() {
        return _controller.loader.value
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(
                          height: 100,
                          width: 150,
                          child: _controller
                                      .photosList.value[index].thumbnailUrl !=
                                  null
                              ? Image.network(_controller
                                  .photosList.value[index].thumbnailUrl!)
                              : SizedBox()),
                      Expanded(
                        child: Column(
                          children: [
                            Text(_controller.photosList.value[index].title ??
                                ""),
                          ],
                        ),
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
                itemCount: _controller.photosList.value.length);
      }),
    );
  }
}
