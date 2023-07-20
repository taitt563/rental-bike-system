import 'dart:developer';

import 'package:bike_rental_online/data/models/user_model.dart';
import 'package:bike_rental_online/data/repositories_impl/user_repository_impl.dart';
import 'package:bike_rental_online/domain/repositories/user_repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final UserRepository userRepository = UserRepositoryImpl();
  final Rx<UserModel> _user = Rx<UserModel>(UserModel(
    id: 'user_id',
    name: 'user_name',
    password: 'user_password',
    email: 'user_email',
    phoneNumber: 'user_phone_number',
    address: 'user_address',
    avatarUrl: 'user_avatar_url',
  ));

  UserModel get user => _user.value;
  set user(UserModel value) => _user.value = value;
  RxBool isReceiveAtStore = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Lấy thông tin người dùng hiện tại
    ever(_user, (UserModel? user) {
      log('User data changed: $user');
    });
    fetchCurrentUser();
  }

  Future<void> fetchCurrentUser() async {
    try {
      final currentUser = await userRepository.getCurrentUser();
      if (currentUser != null) {
        _user.value = currentUser;
      } else {
        // Xử lý trường hợp không có người dùng hiện tại
      }
    } catch (e) {
      print('Lỗi khi lấy thông tin người dùng: $e');
    }
  }

  Future<void> updateProfile({
    required String name,
    required String email,
    required String phoneNumber,
    required String address,
    required String password,
    required String avatarUrl,
  }) async {
    final updatedUser = UserModel(
      id: user.id,
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      address: address,
      password: password,
      avatarUrl: avatarUrl,
    );

    try {
      await userRepository.updateUser(updatedUser);
      user = updatedUser; // Cập nhật thông tin người dùng trong controller

      Get.snackbar('Thành công', 'Đã cập nhật thông tin thành công');
    } catch (e) {
      Get.snackbar('Lỗi', 'Có lỗi xảy ra khi cập nhật thông tin');
      print('Error updating user profile: $e');
    }
  }
}
