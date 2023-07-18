import 'package:bike_rental_online/data/models/bikes_model.dart';
import 'package:get/get.dart';

class BikeDetailController extends GetxController {
  final BikesModel bike;

  BikeDetailController({required this.bike});

  int quantity = 1;
  final int minQuantity = 1;

  void increaseQuantity() {
    quantity++;
  }

  void decreaseQuantity() {
    if (quantity > minQuantity) {
      quantity--;
    }
  }

  void addToCart() {
    // TODO: Implement add to cart functionality
    // You can access the selected bike and quantity using `bike` and `quantity` properties
  }
}