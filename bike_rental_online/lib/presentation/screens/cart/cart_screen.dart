import 'package:bike_rental_online/presentation/controllers/cart_controller.dart';
import 'package:bike_rental_online/presentation/screens/bill/bill_screen.dart';
import 'package:flutter/material.dart' as FlutterMaterial;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController _cartController = Get.find<CartController>();

  DateTime? startAt;
  DateTime? endAt;

  String selectedDuration = '';

  void checkout() {
    // Chuyển sang trang hóa đơn và truyền thông tin từ giỏ hàng

    Get.to(BillScreen());
  }

  void showDateTimePicker(bool isStartAt) async {
    final selectedDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (selectedDateTime != null) {
      final selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (selectedTime != null) {
        setState(() {
          final updatedDateTime = DateTime(
            selectedDateTime.year,
            selectedDateTime.month,
            selectedDateTime.day,
            selectedTime.hour,
            selectedTime.minute,
          );

          if (isStartAt) {
            startAt = updatedDateTime;
            _cartController.setStartDateTime(updatedDateTime);
          } else {
            endAt = updatedDateTime;
            _cartController.setEndDateTime(updatedDateTime);
          }

          // Calculate duration
          if (startAt != null && endAt != null) {
            final duration = endAt!.difference(startAt!);

            if (duration.inHours == 2) {
              selectedDuration = '2 hours';
            } else if (duration.inDays == 1) {
              selectedDuration = '1 day';
            } else {
              selectedDuration = '${duration.inDays} days';
            }
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: _cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = _cartController.cartItems[index];
                  return ListTile(
                    leading: Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(cartItem.bike.photoUrl ?? ''),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      cartItem.bike.name ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4.0),
                        Text(
                          'Price: \$${cartItem.bike.price?['1hour']?.toStringAsFixed(2) ?? ''}',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'Quantity: ${cartItem.getQuantity()}',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () =>
                              _cartController.decrementQuantity(cartItem),
                        ),
                        Text(
                          cartItem.getQuantity().toString(),
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () =>
                              _cartController.incrementQuantity(cartItem),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 16.0),
          ListTile(
            title: Text(
              'Start At',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _cartController.startAt != null
                  ? DateFormat('MMM dd, yyyy hh:mm a')
                      .format(_cartController.startAt!)
                  : '',
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            onTap: () => showDateTimePicker(true),
          ),
          ListTile(
            title: Text(
              'End At',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _cartController.endAt != null
                  ? DateFormat('MMM dd, yyyy hh:mm a')
                      .format(_cartController.endAt!)
                  : '',
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            onTap: () => showDateTimePicker(false),
          ),
          SizedBox(height: 16.0),
          Text(
            'Selected Duration: ${selectedDuration}',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: FlutterMaterial.Colors.white,
          boxShadow: [
            BoxShadow(
              color: FlutterMaterial.Colors.black12,
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: \$${_cartController.totalAmount.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: checkout,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                primary: Color(0xFFFF7643),
                onPrimary: FlutterMaterial.Colors.white,
                padding: EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 24.0,
                ),
              ),
              child: Text(
                'Checkout',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
