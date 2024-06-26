import 'dart:math';

import 'package:bike_rental_online/data/models/order_model.dart';
import 'package:bike_rental_online/presentation/controllers/cart_controller.dart';
import 'package:bike_rental_online/presentation/controllers/order_controller.dart';
import 'package:bike_rental_online/presentation/controllers/profile_controller.dart';
import 'package:bike_rental_online/presentation/screens/order/order_screen.dart';
import 'package:bike_rental_online/presentation/screens/cart/delivery_address.dart';
import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  //CalendarAgenda
  CalendarAgendaController _calendarAgendaControllerAppBar =
      CalendarAgendaController();
  CalendarAgendaController _calendarAgendaControllerNotAppBar =
      CalendarAgendaController();

  // late DateTime _selectedDateAppBBar;
  // late DateTime _selectedDateNotAppBBar;
  Random random = new Random();

  final CartController _cartController = Get.find<CartController>();
  final ProfileController _profileController = Get.find<ProfileController>();
  DateTime? startAt;
  DateTime? endAt;

  String selectedDuration = '';

  String generateOrderId() {
    // Get the current timestamp in milliseconds
    final int timestamp = DateTime.now().millisecondsSinceEpoch;

    // Generate a random number between 1000 and 9999
    final int randomNumber = Random().nextInt(9000) + 1000;

    // Combine the timestamp and random number to create the order ID
    return 'ORDER$timestamp$randomNumber';
  }

  void checkout() {
    // Chuyển sang trang hóa đơn và truyền thông tin từ giỏ hàng
    final String userId = _profileController.user.id;
    final List<String> bikeIds =
        _cartController.cartItems.map((item) => item.bike.id!).toList();

    if (_cartController.startAt == null || _cartController.endAt == null) {
      Get.snackbar(
        'Error',
        'Please select both start date and end date.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    final double totalAmount = _cartController.totalAmount;

    final order = OrderModel(
      order_id:
          generateOrderId(), // You can generate an order ID or use any other method
      user_id: userId,
      bike_id: bikeIds, // Combine bike IDs into a comma-separated string
      startAt: _cartController.startAt!,
      endAt: _cartController.endAt!,
      totalAmount: totalAmount,
      pickupLocation: _profileController
          .user.address, // Replace with the actual pickup location
      dropLocation: _profileController
          .user.address, // Replace with the actual drop location
    );
    _cartController.createOrder(order);
    Get.find<OrderController>().order.value = order;
    Get.to(() => OrderScreen());
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
  void initState() {
    super.initState();
    // _selectedDateAppBBar = DateTime.now();
    // _selectedDateNotAppBBar = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAgenda(
        backgroundColor: Color(0xFFFF7643),
        controller: _calendarAgendaControllerAppBar,
        // appbar: true,
        selectedDayPosition: SelectedDayPosition.right,
        leading: SizedBox(
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              TextButton(
                onPressed: () {
                  _calendarAgendaControllerAppBar.goToDay(DateTime.now());
                },
                child: Text(
                  'Chọn ngày thuê',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        weekDay: WeekDay.long,
        fullCalendarScroll: FullCalendarScroll.horizontal,
        fullCalendarDay: WeekDay.long,
        selectedDateColor: Colors.orange.shade900,
        locale: 'en',
        initialDate: DateTime.now(),
        calendarEventColor: Colors.orange.shade900,
        firstDate: DateTime.now().subtract(Duration(days: 140)),
        lastDate: DateTime.now().add(Duration(days: 60)),
        // events: List.generate(
        //     100,
        //     (index) => DateTime.now()
        //         .subtract(Duration(days: index * random.nextInt(5)))),
        onDateSelected: (date) {
          setState(() {
            _cartController.startAt = date;
          });
        },
        calendarLogo: Image.asset(
          'assets/images/logo.png',
          // scale: 15.0,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            CalendarAgenda(
              backgroundColor: Color(0xFFFF7643),
              controller: _calendarAgendaControllerNotAppBar,
              leading: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: TextButton(
                    onPressed: () {
                      _calendarAgendaControllerNotAppBar
                          .goToDay(DateTime.now().add(Duration(days: 1)));
                    },
                    child: Text(
                      'Chọn ngày trả xe',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              // fullCalendar: false,
              locale: 'en',
              weekDay: WeekDay.long,
              fullCalendarDay: WeekDay.long,
              fullCalendarScroll: FullCalendarScroll.horizontal,
              selectedDateColor: Colors.orange.shade900,
              initialDate: DateTime.now().add(Duration(days: 1)),
              firstDate: DateTime.now().subtract(Duration(days: 140)),
              lastDate: DateTime.now().add(Duration(days: 7)),
              events: List.generate(
                  100,
                  (index) => DateTime.now()
                      .subtract(Duration(days: index * random.nextInt(5)))),
              onDateSelected: (date) {
                setState(() {
                  _cartController.endAt = date;
                });
              },
              calendarLogo: Image.asset(
                'assets/images/logo.png',
                // scale: 15.0,
              ),
            ),

            DeliveryAddress(),

            // Text('Selected date is ${_cartController.endAt}'),
            SizedBox(
              height: 20.0,
            ),
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
                'Tổng: \$${_cartController.totalAmount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: checkout,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  primary: Color(0xFFFF7643),
                  onPrimary: Colors.white,
                  padding: EdgeInsets.all(13.0),
                ),
                child: Text(
                  'Tiếp tục',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
