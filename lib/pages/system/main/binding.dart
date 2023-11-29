import 'package:flutter_woo_commerce_getx_learn/pages/index.dart';
import 'package:get/get.dart';


class MainBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => MainController());
  }
}