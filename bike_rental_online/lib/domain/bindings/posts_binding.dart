import 'package:bike_rental_online/domain/repositories/post_repository.dart';
import 'package:bike_rental_online/presentation/controllers/posts_controller.dart';
import 'package:get/instance_manager.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostController>(
        () => PostController(Get.find<PostRepository>()));
  }
}
