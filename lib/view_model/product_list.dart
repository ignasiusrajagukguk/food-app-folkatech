import 'dart:convert';

import 'package:food_app_folkatech/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductListService {
  Future<List<Product>> getProductList() async {
    String url = 'https://mocki.io/v1/52c41978-6e31-4ea3-b917-01899e3ed373';
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      final dataList = jsonDecode(response.body) as List;
      List<Product> productList = dataList.map((e) {
        Product product = Product.fromJson(e);
        return product;
      }).toList();
      return productList;
    }
    return [];
  }
}
