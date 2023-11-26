
import 'package:get/get.dart';

import '../../pages/system/login/index.dart';

class RoutePages {
  // 列表
  static List<GetPage> list = [
    GetPage(
      name: "/",
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
