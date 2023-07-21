import 'package:bike_rental_online/data/models/order_model.dart';

abstract class OrderRepository {
  Future<void> createOrder(OrderModel order);
  Future<OrderModel?> getOrderById(String orderId);
  Stream<List<OrderModel>> getOrderStreamByUserId(String userId);
  Future<void> updateOrderStatus(String orderId, String status);
}