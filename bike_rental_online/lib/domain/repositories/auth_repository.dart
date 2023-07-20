import 'package:bike_rental_online/data/models/user_model.dart';

abstract class AuthRepository {
  Future<bool> login(String email, String password);
  Future<bool> register(String email, String password);
  Future<void> logout();
  Future<void> verifyPhoneNumber(String phoneNumber);
  Future<void> verifyOTP(String otp);
}
