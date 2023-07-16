import 'package:bike_rental_online/domain/bindings/auth_binding.dart';
import 'package:bike_rental_online/domain/bindings/dashboard_binding.dart';
import 'package:bike_rental_online/domain/bindings/posts_binding.dart';
import 'package:bike_rental_online/domain/bindings/splash_binding.dart';
import 'package:bike_rental_online/presentation/routes/app_routes.dart';
import 'package:bike_rental_online/presentation/screens/bookmarks/bookmark_screen.dart';
import 'package:bike_rental_online/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:bike_rental_online/presentation/screens/home/home_screen.dart';
import 'package:bike_rental_online/presentation/screens/mailbox/mailbox_screen.dart';
import 'package:bike_rental_online/presentation/screens/posts/posts_page.dart';
import 'package:bike_rental_online/presentation/screens/settings/setting_screen.dart';
import 'package:bike_rental_online/presentation/screens/signin/password_input_screen.dart';
import 'package:bike_rental_online/presentation/screens/signin/signin_screen.dart';
import 'package:bike_rental_online/presentation/screens/signup/signup_screen.dart';
import 'package:bike_rental_online/presentation/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.Splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.Signup,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: AppRoutes.Signin,
      page: () => SignInScreen(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: AppRoutes.PasswordInput,
      page: () => PasswordInputScreen(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: AppRoutes.Dashboard,
      page: () => DashBoardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.Home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.Bookmarks,
      page: () => BookmarkScreen(),
    ),
    GetPage(
      name: AppRoutes.Mailbox,
      page: () => MailboxScreen(),
    ),
    GetPage(
      name: AppRoutes.Settings,
      page: () => SettingsScreen(),
    ),
    GetPage(
      name: AppRoutes.PostsPage,
      page: () => PostsPage(),
      binding: PostBinding(),
    ),
  ];
}
