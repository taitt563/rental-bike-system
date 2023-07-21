import 'package:bike_rental_online/core/constants/colors.dart';
import 'package:bike_rental_online/data/models/bikes_model.dart';
import 'package:bike_rental_online/data/models/order_model.dart';
import 'package:bike_rental_online/presentation/controllers/bike_controller.dart';
import 'package:bike_rental_online/presentation/controllers/cart_controller.dart';
import 'package:bike_rental_online/presentation/controllers/order_controller.dart';
import 'package:bike_rental_online/presentation/screens/checkout/checkout_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final CartController _cartController = Get.find<CartController>();
  final OrderController _orderController = Get.find<OrderController>();
  BikeController? bikeController;

  @override
  void initState() {
    super.initState();
    _orderController.fetchOrders();
    bikeController = Get.find<BikeController>(); // Khởi tạo BikeController
  }

  @override
  Widget build(BuildContext context) {
    if (bikeController == null) {
      // Nếu bikeController là null, hiển thị màn hình loading
      return Scaffold(
        appBar: AppBar(
          title: Text('Thanh toán'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final OrderModel? order = _orderController.order.value;

    final List<String> bikeIds = order?.bike_id ?? [];

    // Lấy danh sách xe đã đặt hàng từ BikeController
    final List<BikesModel> orderedBikes =
        bikeController!.getOrderedBikes(bikeIds);

    if (order == null || orderedBikes.isEmpty) {
      // Nếu đơn hàng là null hoặc không có dữ liệu về xe, hiển thị màn hình loading
      return Scaffold(
        appBar: AppBar(
          title: Text('Thanh toán'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Thanh toán'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Thông tin đơn hàng',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: TColors.textfield),
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thời gian thuê',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Bắt đầu:'),
                      Text(order.startAt != null
                          ? DateFormat('MMM dd, yyyy hh:mm a')
                              .format(order.startAt!)
                          : ''),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Kết thúc: '),
                      Text(order.endAt != null
                          ? DateFormat('MMM dd, yyyy hh:mm a')
                              .format(order.endAt!)
                          : ''),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(color: TColors.textfield),
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tóm tắt đơn hàng',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Mã đơn hàng: '),
                      Text('${order.order_id}'),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: orderedBikes.length,
                    itemBuilder: (context, index) {
                      final bike = orderedBikes[index];
                      return Container(
                        padding: EdgeInsets.all(
                            8.0), // Thiết lập khoảng cách giữa các ListTile
                        width: double.infinity,
                        child: ListTile(
                          leading: Image.network(
                            bike.photoUrl ?? '',
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.cover,
                          ),
                          title: Text(bike.name ?? ''),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Giá: \$${bike.price?['1hour'] ?? 'N/A'}'),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(color: TColors.textfield),
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thông tin thanh toán',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tổng tiền:'),
                      Text('\$${order.totalAmount.toStringAsFixed(2)}'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Phí vận chuyển:'),
                      Text('\$2'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: TColors.secondaryText.withOpacity(0.5),
                    height: 1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tổng thanh toán:'),
                      Text('\$${(order.totalAmount - 2).toStringAsFixed(2)}'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'Tổng thanh toán: \$${(order.totalAmount - 2).toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => CheckoutScreen());
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  backgroundColor: Color(0xFFFF7643),
                  onPrimary: Colors.white,
                  padding: EdgeInsets.all(13.0),
                ),
                child: Text('Thanh toán'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
