import 'package:flutter/material.dart';
import 'package:food_app_folkatech/model/product_model.dart';
import 'package:food_app_folkatech/view_model/product_list.dart';

class ProductListProvider with ChangeNotifier {
  final ProductListService _service = ProductListService();
  bool isLoading = true;
  List<Product> _productList = [];
  List<Product> get productList => _productList;

  Future<void> getAllProduct() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getProductList();
    _productList = response;

    isLoading = false;
    notifyListeners();
  }
}
