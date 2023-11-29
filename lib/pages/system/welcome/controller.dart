import 'package:get/get.dart';

import '../../../common/i18n/locale_keys.dart';
import '../../../common/models/welcome_model.dart';
import '../../../common/values/index.dart';

class WelcomeController extends GetxController {
  WelcomeController();

  List<WelcomeModel>? items;
  // 当前位置
  int currentIndex = 0;

  _initData() {
    items = [
      WelcomeModel(
        image: AssetsImages.welcome_1Png,
        title: LocaleKeys.welcomeOneTitle.tr,
        desc: LocaleKeys.welcomeOneDesc.tr,
      ),
      WelcomeModel(
        image: AssetsImages.welcome_2Png,
        title: LocaleKeys.welcomeTwoTitle.tr,
        desc: LocaleKeys.welcomeTwoDesc.tr,
      ),
      WelcomeModel(
        image: AssetsImages.welcome_3Png,
        title: LocaleKeys.welcomeThreeTitle.tr,
        desc: LocaleKeys.welcomeThreeDesc.tr,
      ),
    ];
    update(["slider"]);
  }
  // 当前位置发生改变
  void onPageChanged(int index) {
    currentIndex = index;
    update(['slider', 'bar']);
  }
  @override
  void onReady() {
    super.onReady();
    _initData();
  }
}
