import 'dart:developer';

import 'package:bike_rental_online/data/models/post_photos_model.dart';
import 'package:bike_rental_online/data/providers/network/model/api_results.dart';
import 'package:bike_rental_online/domain/repositories/post_repository.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PostController extends GetxController {
  final PostRepository postRepository;
  PostController(this.postRepository);

  RxBool loader = false.obs;

  RxList<PostPhotosModel> photosList = <PostPhotosModel>[].obs;

  Future<void> getPhotosCall() async {
    loader.value = true;
    ApiResults results = await postRepository.getPhotos();
    results.when(
      success: (data, url, headers, statusCode) {
        photosList.value = postPhotosModelFromJson(data);
        log("post response: ---------------> ${photosList.value}");
      },
      error: (data, url, headers, statusCode) {},
      failure: (networkException) {},
    );

    loader.value = false;
  }

  @override
  void onInit() {
    getPhotosCall();
    super.onInit();
  }
}
