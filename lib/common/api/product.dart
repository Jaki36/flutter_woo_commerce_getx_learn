import '../index.dart';
import '../models/index.dart';
import '../models/request/product.dart';
import '../models/woo/category_model/category_model.dart';
import '../models/woo/product_model/product_model.dart';

/// 商品 api
class ProductApi {
  /// 分类列表
  static Future<List<CategoryModel>> categories() async {
    var res = await WPHttpService.to.get(
      '/products/categories',
    );

    List<CategoryModel> categories = [];
    for (var item in res.data) {
      categories.add(CategoryModel.fromJson(item));
    }
    // 排序 menuOrder , 小号在前
    categories.sort((a, b) => a.menuOrder!.compareTo(b.menuOrder as int));
    return categories;
  }

  /// 商品列表
  static Future<List<ProductModel>> products(ProductsReq? req) async {
    var res = await WPHttpService.to.get(
      '/products',
      params: req?.toJson(),
    );

    List<ProductModel> products = [];
    for (var item in res.data) {
      products.add(ProductModel.fromJson(item));
    }
    return products;
  }
}