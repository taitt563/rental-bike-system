import 'package:bike_rental_online/presentation/controllers/bike_controller.dart';
import 'package:get/get.dart';

class BikeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BikeController>(() => BikeController());
  }
}
