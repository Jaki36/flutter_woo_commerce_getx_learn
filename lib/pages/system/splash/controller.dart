import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../../common/routers/names.dart';
import '../../../common/services/config.dart';

class SplashController extends GetxController {
  SplashController();

  String title = "";

  void onTap(int ticket) {    title = "GetBuilder -> 点击了第 $ticket 个按钮";
    update(['splash_title']);
  }
  _jumpToPage() {
    // 欢迎页
    Future.delayed(const Duration(seconds: 1), () {
      Get.offAllNamed(RouteNames.systemWelcome);
    });
  }
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    // 删除设备启动图
    FlutterNativeSplash.remove(); // 删除设备启动图 - 显示第一个page就要关闭FlutterNativeSplash插件。
    // _jumpToPage(); // 跳转界面
    // 样式配置
    if (ConfigService.to.isAlreadyOpen == false) {
      Get.offAllNamed(RouteNames.systemWelcome);
    } else {
      Get.offAllNamed(RouteNames.main);
    }
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
