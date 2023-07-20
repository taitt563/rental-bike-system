import 'package:bike_rental_online/data/models/user_model.dart';
import 'package:bike_rental_online/data/repositories_impl/auth_repository_impl.dart';
import 'package:bike_rental_online/data/repositories_impl/user_repository_impl.dart';
import 'package:bike_rental_online/domain/repositories/auth_repository.dart';
import 'package:bike_rental_online/domain/repositories/user_repository.dart';
import 'package:bike_rental_online/presentation/routes/app_routes.dart';
import 'package:bike_rental_online/presentation/screens/main_tab/main_tab_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final String signInTitle = 'Sign In';
  final String signUpTitle = 'Sign Up';
  final email = ''.obs;
  final password = ''.obs;

  void updateEmail(String value) {
    email.value = value;
  }

  void updatePassword(String value) {
    password.value = value;
  }

  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final UserRepository _userRepository = UserRepositoryImpl();
  final AuthRepository authRepository;
  AuthController(this.authRepository);
  Rx<User?> currentUser = Rx<User?>(null);
  RxBool isLoggedIn = false.obs;
  RxBool isLoading = false.obs;

  Future<void> loginCall(String email, String password) async {
    try {
      isLoggedIn.value = false;
      bool loginSuccess = await authRepository.login(email, password);
      if (loginSuccess) {
        isLoggedIn.value = true;
        Get.snackbar('Đăng nhập', 'Đăng nhập thành công');
        await Future.delayed(Duration(seconds: 2));
        Get.to(MainTabView());
      }
    } catch (e) {
      print('Đăng nhập không thành công: $e');
      Get.snackbar('Đăng nhập', 'Đăng nhập không thành công');
    }
  }

  bool validateSignUp(String email, String password, String confirmPassword) {
    if (email.isEmpty) {
      Get.snackbar('Validation Error', 'Please enter an email');
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Validation Error', 'Please enter a password');
      return false;
    }

    if (password != confirmPassword) {
      Get.snackbar('Validation Error', 'Password does not match');
      return false;
    }

    return true;
  }

  Future<void> registerCall(String email, String password) async {
    try {
      isLoggedIn.value = false;
      bool registerSuccess = await authRepository.register(email, password);
      if (registerSuccess) {
        isLoggedIn.value = true;
        UserModel user = UserModel(
          id: FirebaseAuth.instance.currentUser!.uid,
          email: email,
          password: password,
          address: '',
          phoneNumber: '',
          name: '',
          avatarUrl: '',
        );
        await _userRepository.createUser(user);
        Get.offAllNamed(AppRoutes.PhoneInput);
      }
    } catch (e) {
      print('Đăng ký không thành công: $e');
      Get.snackbar('Thông báo', 'Đăng ký không thành công');
    }
  }

  Future<void> logoutCall() async {
    try {
      isLoggedIn.value = false;
      await authRepository.logout();
      Get.offAndToNamed(AppRoutes.Signin);
    } catch (e) {
      print('Đăng xuất không thành công: $e');
      Get.snackbar('Đăng xuất', 'Đăng xuất không thành công');
    }
  }

  void logoutAndReset() {
    logoutCall(); // Gọi phương thức logoutCall() để đăng xuất

    // Gọi lại Get.put(AuthRepository()) để cung cấp một phiên bản mới của AuthRepository
    Get.put<AuthRepository>(AuthRepositoryImpl());

    // Chuyển hướng đến trang đăng nhập
    Get.offAllNamed(AppRoutes.Signin);
  }

  void navigateToSignUp() {
    Get.toNamed(AppRoutes.Signup);
  }

  void navigateToPasswordInput() {
    Get.toNamed(AppRoutes.PasswordInput);
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
