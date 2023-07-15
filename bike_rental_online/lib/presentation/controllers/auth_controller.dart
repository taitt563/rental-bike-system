import 'package:bike_rental_online/domain/repositories/auth_repository.dart';
import 'package:bike_rental_online/presentation/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final AuthRepository authRepository;
  AuthController(this.authRepository);

  Rx<User?> currentUser = Rx<User?>(null);
  RxBool isLoggedIn = false.obs;

  Future<void> loginCall(String email, String password) async {
    await authRepository.login(email, password);
    Get.toNamed(AppRoutes.PostsPage);
    isLoggedIn.value = true;
  }

  @override
  void onInit() {
    super.onInit();
    // Check if the user is already signed in
    currentUser.value = _firebaseAuth.currentUser;
    _firebaseAuth.authStateChanges().listen((User? user) {
      currentUser.value = user;
    });
  }
}
