import 'package:bike_rental_online/domain/repositories/auth_repository.dart';
import 'package:bike_rental_online/presentation/screens/posts/posts_page.dart';
import 'package:bike_rental_online/presentation/screens/signin/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<void> login(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      // Handle login error
      Get.snackbar('Login Error', e.toString());
    }
  }

  @override
  Future<void> logout() async {
    // try {
    //   await _firebaseAuth.signOut();
    // } catch (e) {
    //   Get.snackbar('Logout Error', e.toString());
    // }
  }
}
