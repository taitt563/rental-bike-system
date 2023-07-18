import 'package:bike_rental_online/domain/repositories/auth_repository.dart';
import 'package:bike_rental_online/presentation/screens/posts/posts_page.dart';
import 'package:bike_rental_online/presentation/screens/signin/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<bool> login(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return true; // Đăng nhập thành công
    } catch (e) {
      // Xử lý lỗi đăng nhập
      print('Login error: $e');
      Get.snackbar('Đăng nhập', 'Đăng nhập không thành công');
      return false; // Đăng nhập không thành công
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      Get.snackbar('Logout Error', e.toString());
    }
  }

  @override
  @override
  Future<bool> register(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true; // Đăng ký thành công
    } catch (e) {
      // Xử lý lỗi đăng ký
      print('Registration error: $e');
      return false; // Đăng ký không thành công
    }
  }
}
