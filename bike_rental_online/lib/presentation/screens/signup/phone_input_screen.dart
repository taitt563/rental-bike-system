import 'package:bike_rental_online/presentation/controllers/otp_controller.dart';
import 'package:bike_rental_online/presentation/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneInputScreen extends StatelessWidget {
  final TextEditingController phoneNumberController = TextEditingController();
  void navigateToOTPScreen(String phoneNumber) {
    Get.toNamed(AppRoutes.OTPInput, arguments: phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    final OTPController otpController = Get.find();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Thanh toán an toàn',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Email chưa có tài khoản Sbike, nhập số điện thoại của bạn dể tạo tài khoản',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Form(
              child: TextFormField(
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Số điện thoại',
                  hintStyle: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Vui lòng nhập số điện thoại';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final phoneNumber = phoneNumberController.text.trim();
                if (phoneNumber.isNotEmpty) {
                  otpController.verifyPhoneNumber(phoneNumber);
                  navigateToOTPScreen(phoneNumber);
                } else {
                  Get.snackbar('Lỗi', 'Vui lòng nhập số điện thoại');
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                elevation: 2.0,
                backgroundColor: Color(0xFFFF7643),
              ),
              child: Text(
                'Tiếp tục',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
