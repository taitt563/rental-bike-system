import 'package:bike_rental_online/domain/bindings/splash_binding.dart';
import 'package:bike_rental_online/presentation/routes/app_routes.dart';
import 'package:bike_rental_online/presentation/screens/signin/signin_screen.dart';
import 'package:bike_rental_online/presentation/screens/signup/signup_screen.dart';
import 'package:bike_rental_online/presentation/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.Splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(name: AppRoutes.Signup, page: () => const SignUpScreen()),
    GetPage(name: AppRoutes.Signin, page: () => const SignInScreen()),
  ];
}
