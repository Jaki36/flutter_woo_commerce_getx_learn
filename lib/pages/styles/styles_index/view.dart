import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/index.dart';
import 'index.dart';

class StylesIndexPage extends GetView<StylesIndexController> {
  const StylesIndexPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Column(children: [
      ListTile(
        onTap: controller.onLanguageSelected,
        title: Text(
          "语言 : ${ConfigService.to.locale.toLanguageTag()}",
            style: TextStyle(color:Colors.blue)
        ),
      ),
      ListTile(
        onTap: controller.onThemeSelected,
        title:
        Text(
            "主题 : ${ConfigService.to.isDarkModel ? "Dark" : "Light"}",
            style: TextStyle(color:Colors.blue)
        ),
      ),
      ListTile(
        title:  TextWidget.title1("Text 文本",color: Colors.blue,),
      ),
      // Icon 图标
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesIcon),
        title: const TextWidget.body1("Icon 图标",color: Colors.blue,),
      ),
      // Image 图片
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesImage),
        title: const TextWidget.body1("Image 图片",color: Colors.blue),
      ),
      // Button 按钮
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesButtons),
        title: const TextWidget.body1("Button 按钮",color: Colors.blue),
      ),
      // Input 输入框
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesInputs),
        title: const TextWidget.body1("Input 输入框",color: Colors.blue),
      ),
      // form 表单
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesTextForm),
        title: const TextWidget.body1("form 表单", color: Colors.blue),
      ),
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StylesIndexController>(
      init: StylesIndexController(),
      id: "styles_index",
      builder: (_) {
        return Scaffold(
          // appBar: AppBar(title: const Text("styles_index")),
          appBar: AppBar(title: Text(LocaleKeys.stylesTitle.tr)),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
