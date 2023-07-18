import 'package:bike_rental_online/data/providers/network/contract.dart';
import 'package:bike_rental_online/data/providers/network/http/http_contract.dart';
import 'package:bike_rental_online/data/providers/network/http/http_implementation.dart';
import 'package:bike_rental_online/data/providers/network/implementation.dart';
import 'package:bike_rental_online/data/repositories_impl/auth_repository_impl.dart';
import 'package:bike_rental_online/data/repositories_impl/bike_repository_impl.dart';
import 'package:bike_rental_online/data/repositories_impl/category_repository_impl.dart';
import 'package:bike_rental_online/data/repositories_impl/post_repository_impl.dart';
import 'package:bike_rental_online/domain/repositories/auth_repository.dart';
import 'package:bike_rental_online/domain/repositories/bike_repository.dart';
import 'package:bike_rental_online/domain/repositories/category_repository.dart';
import 'package:bike_rental_online/domain/repositories/post_repository.dart';
import 'package:bike_rental_online/presentation/controllers/auth_controller.dart';
import 'package:bike_rental_online/presentation/controllers/bike_controller.dart';
import 'package:bike_rental_online/presentation/controllers/cart_controller.dart';
import 'package:bike_rental_online/presentation/controllers/category_controller.dart';
import 'package:bike_rental_online/presentation/controllers/dashboard_controller.dart';
import 'package:bike_rental_online/presentation/controllers/splash_controller.dart';
import 'package:get/get.dart';

class Dependency {
  static init() {
    Get.lazyPut<HttpNetwork>(() => HttpNetworkImplementation(), fenix: true);
    Get.lazyPut<Network>(() => NetworkImplementation(Get.find<HttpNetwork>()));

    // splash
    Get.lazyPut<SplashController>(() => SplashController());
    // Get.lazyPut<AppController>(() => AppController());
    //dashboard
    Get.lazyPut<DashboardController>(() => DashboardController());
    // auth
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl());
    //photos
    // Get.lazyPut<PostRepository>(() => PostRepositoryImpl(Get.find<Network>()));

    //bike
    Get.lazyPut<BikeRepository>(() => BikeRepositoryImpl());
    Get.lazyPut<BikeController>(() => BikeController());
    Get.put<BikeController>(BikeController());

    //cart
    Get.put<CartController>(CartController());
    //category
    Get.lazyPut<CategoryRepository>(() => CategoryRepositoryImpl());
    Get.lazyPut<CategoryController>(() => CategoryController());
  }
}
