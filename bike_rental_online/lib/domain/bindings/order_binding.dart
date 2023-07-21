import 'package:bike_rental_online/data/repositories_impl/order_repository_impl.dart';
import 'package:bike_rental_online/domain/repositories/order_repository.dart';
import 'package:bike_rental_online/presentation/controllers/order_controller.dart';
import 'package:get/get.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderRepository>(() => OrderRepositoryImpl());
    Get.put<OrderController>(OrderController());
  }
}
