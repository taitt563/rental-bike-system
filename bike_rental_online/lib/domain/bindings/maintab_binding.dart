import 'package:bike_rental_online/data/repositories_impl/auth_repository_impl.dart';
import 'package:bike_rental_online/domain/repositories/auth_repository.dart';
import 'package:bike_rental_online/presentation/controllers/auth_controller.dart';
import 'package:bike_rental_online/presentation/controllers/bookmark_controller.dart';
import 'package:bike_rental_online/presentation/controllers/dashboard_controller.dart';
import 'package:bike_rental_online/presentation/controllers/home_controller.dart';
import 'package:bike_rental_online/presentation/controllers/mailbox_controller.dart';
import 'package:bike_rental_online/presentation/controllers/setting_controller.dart';
import 'package:get/get.dart';

class MainTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthRepository>(AuthRepositoryImpl());
    Get.lazyPut<AuthController>(
        () => AuthController(Get.find<AuthRepository>()));
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SettingController>(() => SettingController());
    Get.lazyPut<BookmarkController>(() => BookmarkController());
    Get.lazyPut<MailboxController>(() => MailboxController());
  }
}