import 'package:bike_rental_online/presentation/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordInputScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Nhập mật khẩu',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Obx(
              () => Text(
                'Vui lòng nhập mật khẩu Sbike của email ${authController.email.value}',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(height: 16.0),
            Form(
              key: _formKey,
              child: Obx(
                () => TextFormField(
                  onChanged: authController.updatePassword,
                  obscureText: !authController.isPasswordVisible.value,
                  decoration: InputDecoration(
                    hintText: 'Mật khẩu',
                    hintStyle: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                    ),
                    border: InputBorder.none,
                    suffixIcon: TextButton(
                      onPressed: () {
                        authController.isPasswordVisible.toggle();
                      },
                      child: Text(
                        authController.isPasswordVisible.value ? 'Ẩn' : 'Hiện',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Mật khẩu không được để trống';
                    } else if (value!.length < 6 || value.length > 12) {
                      return 'Mật khẩu phải có từ 6 đến 12 kí tự';
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  authController.loginCall(authController.email.value,
                      authController.password.value);
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
            SizedBox(height: 16.0),
            Align(
              alignment: Alignment.bottomLeft,
              child: TextButton(
                onPressed: () {
                  // Xử lý khi người dùng nhấn vào "Quên mật khẩu?"
                  // Điều hướng đến trang khôi phục mật khẩu
                },
                child: Text(
                  'Quên mật khẩu?',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
