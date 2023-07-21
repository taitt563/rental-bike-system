import 'package:bike_rental_online/data/models/order_model.dart';
import 'package:bike_rental_online/domain/repositories/order_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderRepositoryImpl extends OrderRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> createOrder(OrderModel order) async {
    try {
      await _firebaseFirestore.collection('Orders').doc(order.order_id).set(
            order.toJson(),
          );
    } catch (e) {
      print('Error creating order: $e');
      throw e;
    }
  }

  @override
  Future<OrderModel?> getOrderById(String orderId) async {
    try {
      final orderSnapshot =
          await _firebaseFirestore.collection('Orders').doc(orderId).get();

      if (orderSnapshot.exists) {
        final orderData = orderSnapshot.data() as Map<String, dynamic>;
        final order = OrderModel.fromJson(orderData);
        return order;
      }
      return null;
    } catch (e) {
      print('Error getting order by id: $e');
      throw e;
    }
  }

  @override
  Stream<List<OrderModel>> getOrderStreamByUserId(String userId) {
    try {
      return _firebaseFirestore
          .collection('Orders')
          .where('user_id', isEqualTo: userId)
          .snapshots()
          .map((querySnapshot) {
        return querySnapshot.docs.map((doc) {
          final orderData = doc.data() as Map<String, dynamic>;
          return OrderModel.fromJson(orderData);
        }).toList();
      });
    } catch (e) {
      print('Error getting order stream by user id: $e');
      throw e;
    }
  }

  @override
  Future<void> updateOrderStatus(String orderId, String status) async {
    try {
      await _firebaseFirestore
          .collection('Orders')
          .doc(orderId)
          .update({'status': status});
    } catch (e) {
      print('Error updating order status: $e');
      throw e;
    }
  }
}
