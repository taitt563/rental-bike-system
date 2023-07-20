import 'package:bike_rental_online/domain/repositories/auth_repository.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final AuthRepository authRepository = Get.find<AuthRepository>();
  var tabIndex = 0;
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
