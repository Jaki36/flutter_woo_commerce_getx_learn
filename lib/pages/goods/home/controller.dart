import 'package:get/get.dart';

import '../../../common/api/system.dart';
import '../../../common/models/kv.dart';

class HomeController extends GetxController {
  HomeController();

  _initData() async {
    bannerItems = await SystemApi.banners();
    update(["home"]);
  }
// Banner 当前位置
  int bannerCurrentIndex = 0;

  // Banner 数据
  List<KeyValueModel> bannerItems = [];

  // Banner 切换事件
  void onChangeBanner(int index, /*CarouselPageChangedReason*/ reason) {
    bannerCurrentIndex = index;
    update(["home_banner"]);
  }

  // 导航点击事件
  void onAppBarTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
