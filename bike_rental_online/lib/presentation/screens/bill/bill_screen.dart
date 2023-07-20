import 'package:bike_rental_online/data/models/cart_model.dart';
import 'package:bike_rental_online/presentation/controllers/cart_controller.dart';
import 'package:bike_rental_online/presentation/routes/app_routes.dart';
import 'package:bike_rental_online/presentation/screens/checkout/checkout_screen.dart';
import 'package:bike_rental_online/presentation/screens/home/home_screen.dart';
import 'package:bike_rental_online/presentation/screens/success/success_screen.dart';
import 'package:flutter/material.dart' as FlutterMaterial;
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BillScreen extends StatefulWidget {
  @override
  _BillScreenState createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  final CartController _cartController = Get.find<CartController>();

  DateTime? startAt;
  DateTime? endAt;

  String pickupLocation = '';
  String dropoffLocation = '';

  bool paymentConfirmed = false;

  void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Are you sure you want to proceed with payment?'),
          actions: [
            TextButton(
              onPressed: () {
                // Đánh dấu thanh toán đã được xác nhận
                setState(() {
                  paymentConfirmed = true;
                });
                // Đóng hộp thoại
                Get.to(() => CheckoutScreen());
              },
              child: Text('Pay'),
            ),
            TextButton(
              onPressed: () {
                // Đánh dấu thanh toán chưa được xác nhận
                setState(() {
                  paymentConfirmed = false;
                });
                // Đóng hộp thoại
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startAt = _cartController.startAt;
    endAt = _cartController.endAt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bill'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Details',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Rental Duration',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(startAt != null
                ? 'Start At: ' +
                    DateFormat('MMM dd, yyyy hh:mm a').format(startAt!)
                : ''),
            Text(endAt != null
                ? 'End At: ' + DateFormat('MMM dd, yyyy hh:mm a').format(endAt!)
                : ''),
            SizedBox(height: 16.0),
            Text(
              'Order Summary',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: _cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = _cartController.cartItems[index];
                  return ListTile(
                    leading: Image.network(
                      cartItem.bike.photoUrl ?? '',
                      width: 80.0,
                      height: 80.0,
                      fit: BoxFit.cover,
                    ),
                    title: Text(cartItem.bike.name ?? ''),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Price: \$${cartItem.bike.price?['1hour']}'),
                        Text('Quantity: ${cartItem.getQuantity()}'),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Pickup Location',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              onChanged: (value) => pickupLocation = value,
              decoration: InputDecoration(
                labelText: 'Enter pickup location',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Dropoff Location',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              onChanged: (value) => dropoffLocation = value,
              decoration: InputDecoration(
                labelText: 'Enter dropoff location',
              ),
            ),
            Text(paymentConfirmed
                ? 'Payment Confirmed'
                : 'Payment Not Confirmed'),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: \$${_cartController.totalAmount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                showConfirmationDialog(context);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                backgroundColor: Color(0xFFFF7643),
                onPrimary: FlutterMaterial.Colors.white,
                padding: EdgeInsets.all(13.0), // Đặt kích thước của nút
              ),
              child: Text('Pay'),
            ),
          ],
        ),
      ),
    );
  }
}
