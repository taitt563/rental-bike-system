import 'package:bike_rental_online/presentation/controllers/profile_controller.dart';
import 'package:bike_rental_online/presentation/screens/cart/address_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Obx(() {
        final isReceiveAtStore =
            Get.find<ProfileController>().isReceiveAtStore.value;
        final user = Get.find<ProfileController>().user;
        return TextButton(
          onPressed: () {
            Get.to(() => AddressSelectionScreen());
          },
          style: TextButton.styleFrom(
            primary: Colors.black, // Text color
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              side: BorderSide.none, // Remove the border
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ), // Add padding around the text
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey.shade100,
                      Colors.grey.shade100,
                    ], // Customize the colors here
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.add_location_alt_outlined,
                      color: Color(0xFFFF7643),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Địa chỉ nhận', // Giữ nguyên dòng chữ này
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ), // Add padding around the user info and address
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${user.name}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(' | ', style: TextStyle(fontSize: 20)),
                        Text(
                          '${user.phoneNumber}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      isReceiveAtStore ? 'Nhận tại cửa hàng' : user.address,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
