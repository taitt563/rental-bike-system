import 'dart:io';

import 'package:bike_rental_online/presentation/controllers/auth_controller.dart';
import 'package:bike_rental_online/presentation/controllers/profile_controller.dart';
import 'package:bike_rental_online/presentation/routes/app_routes.dart';
import 'package:bike_rental_online/presentation/screens/components/round_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController _profileController = Get.put(ProfileController());
  final AuthController authController = Get.find();
  final ImagePicker picker = ImagePicker();
  XFile? image;

  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    txtName.text = _profileController.user.name;
    txtEmail.text = _profileController.user.email;
    txtMobile.text = _profileController.user.phoneNumber;
    txtAddress.text = _profileController.user.address;
    txtPassword.text = _profileController.user.password;
  }

  Future<void> _updateProfile() async {
    // Gọi hàm _updateProfile từ ProfileController
    await _profileController.updateProfile(
      name: txtName.text,
      email: txtEmail.text,
      phoneNumber: txtMobile.text,
      address: txtAddress.text,
      password: txtPassword.text,
      avatarUrl: _profileController.user.avatarUrl,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          child: Container(
            height: 1.0,
            color: Colors.grey.withOpacity(0.5),
          ),
          preferredSize: Size.fromHeight(1.0),
        ),
        title: Row(
          children: [
            Expanded(
                child: Text(
              "Hồ Sơ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            )),
            IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.Cart);
              },
              icon: SvgPicture.asset(
                'assets/icons/Cart Icon.svg', // Đường dẫn tới file SVG
                width: 24.0,
                height: 24.0,
                color: Color(0xFFFF7643),
              ),
            ),
          ],
        ),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Text(
                //         "Hồ Sơ",
                //         style: TextStyle(
                //             color: Colors.black,
                //             fontSize: 20,
                //             fontWeight: FontWeight.w800),
                //       ),
                //       IconButton(
                //         onPressed: () {},
                //         icon: SvgPicture.asset(
                //           'assets/icons/Cart Icon.svg',
                //           color: Color(0xFFFF7643),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(height: 20.0),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xffB6B7B7),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  alignment: Alignment.center,
                  child: image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(File(image!.path),
                              width: 100, height: 100, fit: BoxFit.cover),
                        )
                      : Icon(
                          Icons.person,
                          size: 65,
                          color: Color(0xff7C7D7E),
                        ),
                ),
                TextButton.icon(
                  onPressed: () async {
                    image = await picker.pickImage(source: ImageSource.gallery);
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Color(0xffFC6011),
                    size: 12,
                  ),
                  label: Text(
                    "Chỉnh sửa",
                    style: TextStyle(color: Color(0xffFC6011), fontSize: 12),
                  ),
                ),
                Text(
                  "Xin chào ${_profileController.user.name}!",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                TextButton(
                  onPressed: () {
                    authController.logoutAndReset();
                  },
                  child: Text(
                    "Đăng xuất",
                    style: TextStyle(
                        color: Color(0xff7C7D7E),
                        fontSize: 11,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: RoundTitleTextfield(
                    title: "Họ và Tên",
                    hintText: "Nhập họ và tên của bạn",
                    controller: txtName,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: RoundTitleTextfield(
                    title: "Email",
                    hintText: "Nhập địa chỉ email của bạn",
                    keyboardType: TextInputType.emailAddress,
                    controller: txtEmail,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: RoundTitleTextfield(
                    title: "Số điện thoại",
                    hintText: "Nhập số điện thoại của bạn",
                    controller: txtMobile,
                    keyboardType: TextInputType.phone,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: RoundTitleTextfield(
                    title: "Địa chỉ",
                    hintText: "Nhập địa chỉ của bạn",
                    controller: txtAddress,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: RoundTitleTextfield(
                    title: "Mật khẩu",
                    hintText: "* * * * * *",
                    obscureText: true,
                    controller: txtPassword,
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      // Đăng xuất khỏi ứng dụng
                      _updateProfile();
                      // _profileController.logout();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      elevation: 2.0,
                      backgroundColor: Color(0xFFFF7643),
                    ),
                    child: Text(
                      'Lưu',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
