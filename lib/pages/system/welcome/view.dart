import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/extension/ex_list.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

import '../../../common/components/slider_indicator.dart';
import '../../../common/components/welcome_slider.dart';
import '../../../common/style/space.dart';
import 'index.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({Key? key}) : super(key: key);

  // slider
  Widget _buildSlider() {
    return GetBuilder<WelcomeController>(
      id: "slider",
      init: controller,
      builder: (controller) =>
      controller.items == null
          ? const SizedBox()
          : WelcomeSliderWidget(
              controller.items!,
              onPageChanged: (index) {
              controller.onPageChanged(index);
              },
        carouselController: controller.carouselController,
      ),
    );
  }
  // 控制栏
  Widget _buildBar() {
    return GetBuilder<WelcomeController>(
      id: "bar",
      init: controller,
      builder: (controller) {
        return controller.isShowStart
            ? _buildStartWidget(controller) : _buildIndicratorWidget(controller);
      },
    );
  }

  Widget _buildStartWidget(WelcomeController controller) {
    return // 开始
      ButtonWidget.primary(
        LocaleKeys.welcomeStart.tr,
        onTap: controller.onToMain,
      ).tight(
        width: double.infinity,
        height: 50.h,
      );
  }

  Widget _buildIndicratorWidget(WelcomeController controller) {
    return <Widget>[
      // 跳过
      ButtonWidget.text(
        LocaleKeys.welcomeSkip.tr,
        onTap: controller.onToMain,
      ),
        // 指示标
        SliderIndicatorWidget(
          length: 3,
          currentIndex: controller.currentIndex,
        ),
      // 下一页
      ButtonWidget.text(
        LocaleKeys.welcomeNext.tr,
        onTap: controller.onNext,
      ),

    ].toRow(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      );
  }
  // 内容页
  Widget _buildView() {
    return <Widget>[
      // slider切换
      _buildSlider(),
      _buildBar(),
    ]
        .toColumn(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    )
        .paddingAll(AppSpace.page);
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: WelcomeController(),
      builder: (controller) {
        return _buildView();
    });
  }
}
