import 'package:bike_rental_online/domain/repositories/auth_repository.dart';
import 'package:bike_rental_online/presentation/controllers/auth_controller.dart';
import 'package:get/instance_manager.dart';
class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController(Get.find<AuthRepository>()));
  }
}