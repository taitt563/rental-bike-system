import 'package:bike_rental_online/presentation/controllers/posts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsPage extends StatelessWidget {
  PostsPage({super.key});

  final PostController _controller = Get.find<PostController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts Page'),
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
