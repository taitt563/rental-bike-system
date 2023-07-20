import 'dart:async';
import 'dart:developer';

import 'package:bike_rental_online/presentation/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var verificationId = ''.obs;
  final RxBool canResend = true.obs;
  final RxInt countdown = 30.obs;

  Timer? _resendTimer;

  // Function to start the resend timer
  void startResendTimer() {
    canResend.value = false;
    countdown.value = 30;

    _resendTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown.value <= 0) {
        // Stop the timer and re-enable the resend button
        _resendTimer?.cancel();
        canResend.value = true;
      } else {
        // Continue the countdown
        countdown.value--;
      }
    });
  }

  // Function to stop the resend timer
  void stopResendTimer() {
    _resendTimer?.cancel();
  }

  // Gửi mã xác thực đến số điện thoại được cung cấp
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _firebaseAuth.signInWithCredential(credential);
          // Xác thực thành công, có thể điều hướng sang màn hình tiếp theo ở đây
        },
        verificationFailed: (FirebaseAuthException e) {
          // Xác thực thất bại
          log('Phone verification failed: $e');
          Get.snackbar('Xác thực', 'Xác thực không thành công');
        },
        codeSent: (String verificationId, int? resendToken) {
          // Gửi mã xác thực thành công
          // Lưu mã xác thực (verificationId) để sử dụng sau này
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Thời gian chờ tự động xác thực đã kết thúc
          // Lưu mã xác thực (verificationId) để sử dụng sau này
          this.verificationId.value = verificationId;
        },
      );
      log(phoneNumber);
    } catch (e) {
      print('Phone verification error: $e');
      Get.snackbar('Xác thực', 'Đã xảy ra lỗi trong quá trình xác thực');
    }
  }

  // Xác thực mã OTP được nhập bởi người dùng
  Future<void> verifyOTP(String otpCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: otpCode,
      );

      // Xác thực số điện thoại với mã OTP nhập vào
      await _firebaseAuth.signInWithCredential(credential);
      log(otpCode);
      log('OTP verification success');
      Get.snackbar('Xác thực OTP', 'Xác thực OTP thành công');
      Get.offAllNamed(AppRoutes.MainTab);
      // Xác thực thành công, có thể điều hướng sang màn hình tiếp theo ở đây
    } catch (e) {
      log('OTP verification error: $e');
      Get.snackbar('Xác thực OTP', 'Xác thực OTP không thành công');
    }
  }

  Future<void> resendOTP(String phoneNumber) async {
    try {
      canResend.value = false;
      countdown.value = 30;
      await verifyPhoneNumber(phoneNumber);
      startResendTimer(); // Start the resend timer after successful OTP verification
    } catch (e) {
      print('Resend OTP error: $e');
      Get.snackbar('Gửi lại mã OTP', 'Đã xảy ra lỗi khi gửi lại mã OTP');
      canResend.value = true; // Re-enable the resend button on failure
    }
  }
}
