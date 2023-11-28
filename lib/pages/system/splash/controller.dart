import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController();

  String title = "";

  _initData() {
    update(["splash"]);
  }

  void onTap(int ticket) {    title = "GetBuilder -> 点击了第 $ticket 个按钮";
    update(['splash_title']);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    // 删除设备启动图
    FlutterNativeSplash.remove();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
