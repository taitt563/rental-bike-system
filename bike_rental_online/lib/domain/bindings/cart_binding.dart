import 'package:bike_rental_online/presentation/controllers/cart_controller.dart';
import 'package:get/get.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
  }
}