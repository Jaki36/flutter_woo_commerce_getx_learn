import 'package:get/get.dart';

import '../../../common/api/product.dart';
import '../../../common/api/system.dart';
import '../../../common/models/kv.dart';
import '../../../common/models/request/product.dart';
import '../../../common/models/woo/category_model/category_model.dart';
import '../../../common/models/woo/product_model/product_model.dart';

class HomeController extends GetxController {
  HomeController();

  _initData() async {
    bannerItems = await SystemApi.banners();
    // 分类
    categoryItems = await ProductApi.categories();
    // 推荐商品
    flashShellProductList =
    await ProductApi.products(ProductsReq(featured: true));
    // 新商品
    newProductProductList = await ProductApi.products(ProductsReq());

    update(["home"]);
  }
// Banner 当前位置
  int bannerCurrentIndex = 0;

  // Banner 数据
  List<KeyValueModel> bannerItems = [];

  // 分类导航数据
  List<CategoryModel> categoryItems = [];
  // 推荐商品列表数据
  List<ProductModel> flashShellProductList = [];
  // 最新商品列表数据
  List<ProductModel> newProductProductList = [];

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
