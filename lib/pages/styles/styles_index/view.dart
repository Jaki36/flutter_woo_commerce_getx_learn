import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/i18n/locale_keys.dart';
import '../../../common/services/config.dart';
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
