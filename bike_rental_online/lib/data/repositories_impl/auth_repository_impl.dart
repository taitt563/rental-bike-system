import 'package:bike_rental_online/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var verificationId = ''.obs;
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

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          // Xác thực thất bại
          print('Phone verification failed: $e');
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
    } catch (e) {
      print('Phone verification error: $e');
      Get.snackbar('Xác thực', 'Đã xảy ra lỗi trong quá trình xác thực');
    }
  }

  @override
  Future<void> verifyOTP(String otp) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: otp,
      );
      await _firebaseAuth.signInWithCredential(credential);
      print('OTP verification success');
      Get.snackbar('Xác thực OTP', 'Xác thực OTP thành công');
    } catch (e) {
      print('OTP verification error: $e');
      Get.snackbar('Xác thực OTP', 'Xác thực OTP không thành công');
    }
  }
}
