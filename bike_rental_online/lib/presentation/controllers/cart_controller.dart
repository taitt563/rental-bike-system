import 'package:bike_rental_online/data/models/bikes_model.dart';
import 'package:bike_rental_online/data/models/cart_model.dart';

import 'package:get/get.dart';

class CartController extends GetxController {
  final RxList<CartModel> cartItems = <CartModel>[].obs;
  DateTime? startAt;
  DateTime? endAt;

  void setStartDateTime(DateTime dateTime) {
    startAt = dateTime;
  }

  void setEndDateTime(DateTime dateTime) {
    endAt = dateTime;
  }

  double calculateRentalPrice(Duration duration) {
    final hours = duration.inHours;
    final days = duration.inDays;

    if (hours == 1) {
      return cartItems.first.bike.price?['1hour']!;
    } else if (hours == 2) {
      return cartItems.first.bike.price?['2hours']!;
    } else if (hours == 24) {
      return cartItems.first.bike.price?['24hours']!;
    } else if (days >= 2 && days <= 6) {
      return cartItems.first.bike.price?['days']! * days.toDouble();
    } else if (days == 7) {
      return cartItems.first.bike.price?['7days']! * days.toDouble();
    } else {
      return 0.0;
    }
  }

  void addToCart(BikesModel bike) {
    // Find the index of the existing cart item
    final existingCartItemIndex = cartItems.indexWhere(
      (cartItem) => cartItem.bike.id == bike.id,
    );

    if (existingCartItemIndex != -1) {
      // If the item already exists in the cart, update the quantity
      cartItems[existingCartItemIndex] =
          cartItems[existingCartItemIndex].copyWith(
        quantity: cartItems[existingCartItemIndex].getQuantity() + 1,
      );
    } else {
      // If the item does not exist in the cart, add it as a new cart item
      cartItems.add(
        CartModel(
          bike: bike,
          quantity: 1,
          total: 0.0,
          status: false,
          startAt: DateTime.now(),
          endAt: DateTime.now(),
          pickupLocation: '',
          dropoffLocation: '',
        ),
      );
    }

    Get.snackbar("Giỏ hàng", "Sản phẩm ${bike.name} đã được thêm vào giỏ hàng");
  }

  // Tính tổng giá tiền
  double get totalAmount {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.bike.price?['1hour']! * item.getQuantity();
    }
    return total;
  }

  // Tăng số lượng sản phẩm trong giỏ hàng
  void incrementQuantity(CartModel cartItem) {
    cartItem.getQuantity();
    // Cập nhật lại tổng giá tiền
    update();
  }

  // Giảm số lượng sản phẩm trong giỏ hàng
  void decrementQuantity(CartModel cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.getQuantity();
      // Cập nhật lại tổng giá tiền
      update();
    }
  }

  // Xóa một sản phẩm khỏi giỏ hàng
  void removeItem(CartModel cartItem) {
    cartItems.remove(cartItem);
    // Cập nhật lại tổng giá tiền
    update();
  }
}
