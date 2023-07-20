import 'dart:io';

import 'package:bike_rental_online/core/constants/color_extension.dart';
import 'package:bike_rental_online/presentation/controllers/profile_controller.dart';
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

    txtName.text = _profileController.user.name!;
    txtEmail.text = _profileController.user.email!;
    txtMobile.text = _profileController.user.phoneNumber!;
    txtAddress.text = _profileController.user.address!;
    txtPassword.text = _profileController.user.password!;
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
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Profile",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/icons/Cart Icon.svg'),
                      ),
                    ],
                  ),
                ),
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
                    "Edit Profile",
                    style: TextStyle(color: Color(0xffFC6011), fontSize: 12),
                  ),
                ),
                Text(
                  "Hi there ${_profileController.user.name}!",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Sign Out",
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
                    title: "Name",
                    hintText: "Enter Name",
                    controller: txtName,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: RoundTitleTextfield(
                    title: "Email",
                    hintText: "Enter Email",
                    keyboardType: TextInputType.emailAddress,
                    controller: txtEmail,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: RoundTitleTextfield(
                    title: "Mobile No",
                    hintText: "Enter Mobile No",
                    controller: txtMobile,
                    keyboardType: TextInputType.phone,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: RoundTitleTextfield(
                    title: "Address",
                    hintText: "Enter Address",
                    controller: txtAddress,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: RoundTitleTextfield(
                    title: "Password",
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
                    child: Text('Save'),
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
