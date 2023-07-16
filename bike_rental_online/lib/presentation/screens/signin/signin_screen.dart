import 'package:bike_rental_online/presentation/controllers/auth_controller.dart';
import 'package:bike_rental_online/presentation/screens/components/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'password_input_screen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final AuthController authController = Get.find<AuthController>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  child: Image.asset('assets/images/logo.png',
                      fit: BoxFit.contain),
                ),
                SizedBox(height: 50.0),
                Text(
                  'Xin chào,',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Đăng nhập hoặc Tạo tài khoản',
                  style: TextStyle(fontSize: 14.0),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  onChanged: (value) {
                    _email = value;
                  },
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.normal,
                  ),
                  decoration: InputDecoration(
                    hintText: 'abc@gmail.com',
                    hintStyle: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Địa chỉ email không được để trống';
                    } else if (!GetUtils.isEmail(value!)) {
                      return 'Địa chỉ email không hợp lệ';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      authController.updateEmail(_email);
                      authController.navigateToPasswordInput();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bạn chưa có tài khoản?',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        authController.navigateToSignUp();
                      },
                      child: Text(
                        'Đăng ký',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Hoặc tiếp tục bằng',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey)),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(
                            'assets/icons/google-icon.svg',
                            width: 30.0,
                            height: 30.0,
                          ),
                          onPressed: () {
                            // Xử lý khi người dùng nhấn vào biểu tượng Google
                          },
                        ),
                        SizedBox(width: 16.0),
                        IconButton(
                          icon: SvgPicture.asset(
                            'assets/icons/facebook-2.svg',
                            width: 30.0,
                            height: 30.0,
                          ),
                          onPressed: () {
                            // Xử lý khi người dùng nhấn vào biểu tượng Facebook
                          },
                        ),
                        SizedBox(width: 16.0),
                        IconButton(
                          icon: SvgPicture.asset(
                            'assets/icons/twitter.svg',
                            width: 30.0,
                            height: 30.0,
                          ),
                          onPressed: () {
                            // Xử lý khi người dùng nhấn vào biểu tượng Facebook
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Bằng việc tiếp tục, bạn đã đọc và đồng ý với điều khoản sử dụng và Chính sách bảo mật thông tin cá nhân của Sbike',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
