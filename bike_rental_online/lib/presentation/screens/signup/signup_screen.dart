import 'package:bike_rental_online/presentation/controllers/auth_controller.dart';
import 'package:bike_rental_online/presentation/screens/signup/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AuthController _authController = Get.find<AuthController>();

  late final TextEditingController _emailController;

  late final TextEditingController _passwordController;

  late final TextEditingController _confirmPasswordController;
  

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Tạo tài khoản',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Điền các thông tin bên dưới để tạo tài khoản',
                    style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'abc@example.com',
                      hintStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Email không được để trống';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      // Do something with the value
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    obscureText: !_authController.isPasswordVisible.value,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Nhập mật khẩu',
                      hintStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                      suffixIcon: TextButton(
                        onPressed: () {
                          _authController.isPasswordVisible.toggle();
                        },
                        child: Text(
                          _authController.isPasswordVisible.value
                              ? 'Ẩn'
                              : 'Hiện',
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
                      }
                      return null;
                    },
                    onSaved: (value) {
                      // Do something with the value
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    obscureText:
                        !_authController.isConfirmPasswordVisible.value,
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      hintText: 'Nhập lại mật khẩu',
                      hintStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                      suffixIcon: TextButton(
                        onPressed: () {
                          _authController.isConfirmPasswordVisible.toggle();
                        },
                        child: Text(
                          _authController.isConfirmPasswordVisible.value
                              ? 'Ẩn'
                              : 'Hiện',
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
                      } else if (value != _passwordController.text) {
                        return 'Mật khẩu không trùng khớp';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      // Do something with the value
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        _authController.registerCall(
                          _emailController.text,
                          _passwordController.text,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      elevation: 2.0,
                      backgroundColor: Color(0xFFFF7643),
                    ),
                    child: _authController.isLoading.value
                        ? CircularProgressIndicator()
                        : Text(
                            'Tiếp tục',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                  ),
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
                          color: Colors.blue, // Màu xanh dương
                          fontSize: 16.0,
                        ),
                      ),
                    ),
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
                                fontSize: 16.0, fontWeight: FontWeight.normal),
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
                              // Xử lý khi người dùng nhấn vào biểu tượng Twitter
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Bằng việc tiếp tục, bạn đã đọc và đồng ý với điều khoản sử dụng và Chính sách bảo mật thông tin cá nhân của Sbike',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
