import 'dart:developer';

import 'package:get/get.dart';

class AddressSelectionController extends GetxController {
  final RxBool _isReceiveAtStore = false.obs;

  bool get isReceiveAtStore => _isReceiveAtStore.value;

  void setIsReceiveAtStore(bool value) {
    log('setIsReceiveAtStore: $value');
    _isReceiveAtStore.value = value;
    log('_isReceiveAtStore: ${_isReceiveAtStore.value}');
  }
}
