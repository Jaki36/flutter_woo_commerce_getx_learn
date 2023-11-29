import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_list.dart';
import 'package:get/get.dart';

import '../../../common/components/welcome_slider.dart';
import '../../../common/style/space.dart';
import 'index.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({Key? key}) : super(key: key);

  // slider
  Widget _buildSlider() {
    return GetBuilder<WelcomeController>(
      id: "slider",
      init: WelcomeController(),
      builder: (controller) => controller.items == null
          ? const SizedBox()
          : WelcomeSliderWidget(
        controller.items!,
        onPageChanged: (index) {},
        // carouselController: null,
      ),
    );
  }
  // 内容页
  Widget _buildView() {
    return <Widget>[
      // slider切换
      _buildSlider(),
      // 控制栏
    ]
        .toColumn(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    )
        .paddingAll(AppSpace.page);
  }
  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
