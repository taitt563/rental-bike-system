import 'package:bike_rental_online/data/providers/network/contract.dart';
import 'package:bike_rental_online/data/providers/network/http/http_contract.dart';
import 'package:bike_rental_online/data/providers/network/http/http_implementation.dart';
import 'package:bike_rental_online/data/providers/network/implementation.dart';
import 'package:get/get.dart';

class Dependency {
  static init() {
    Get.lazyPut<HttpNetwork>(() => HttpNetworkImplementation(), fenix: true);
    Get.lazyPut<Network>(() => NetworkImplementation(Get.find<HttpNetwork>()));
  }
}
