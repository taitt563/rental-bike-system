import 'package:bike_rental_online/data/models/order_model.dart';
import 'package:bike_rental_online/data/repositories_impl/order_repository_impl.dart';
import 'package:bike_rental_online/domain/repositories/order_repository.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final OrderRepository _orderRepository = OrderRepositoryImpl();
  final RxList<OrderModel> orders = RxList<OrderModel>([]);
  Rx<OrderModel?> order = Rx<OrderModel?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  void fetchOrders() {
    try {
      final orderStream = _orderRepository.getOrderStreamByUserId('user_id');
      orderStream.listen((orderList) {
        orders.value = orderList;
      }, onError: (e) {
        print('Error fetching orders: $e');
      });
    } catch (e) {
      print('Error fetching orders: $e');
    }
  }

  Future<void> createOrder(OrderModel order) async {
    try {
      await _orderRepository.createOrder(order);
    } catch (e) {
      print('Error creating order: $e');
      rethrow;
    }
  }

  Future<OrderModel?> getOrderById(String orderId) async {
    try {
      final order = await _orderRepository.getOrderById(orderId);
      return order;
    } catch (e) {
      print('Error getting order by id: $e');
      rethrow;
    }
  }

  Future<void> updateOrderStatus(String orderId, String status) async {
    try {
      await _orderRepository.updateOrderStatus(orderId, status);
    } catch (e) {
      print('Error updating order status: $e');
      rethrow;
    }
  }

  final RxBool isLoading = true.obs;
  final RxString error = ''.obs;

  Future<void> fetchOrderById(String orderId) async {
    try {
      isLoading.value = true;
      final order = await _orderRepository.getOrderById(orderId);
      this.order.value = order;
    } catch (e) {
      print('Error getting order by id: $e');
      error.value = 'Failed to fetch order details.';
    } finally {
      isLoading.value = false;
    }
  }
}
