import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_food/data/repositories/recommended_product_repo.dart';
import 'package:my_food/models/product_model.dart';
import '../data/repositories/pupular_product_repo.dart';
import '../utils/colors.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _quantity = 1;
  int get quantity => _quantity;

  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      // print("got products");
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      // print(_popularProductList);
      _isLoaded = true;
      update();
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      if (quantity > 19) {
        _quantity = 20;
        Get.snackbar("ItemCount", "You can't add more!",
            backgroundColor: AppColors.mainColor, colorText: Colors.white);
      } else {
        _quantity++;
      }
    } else {
      if (quantity < 2) {
        _quantity = 1;
        Get.snackbar("ItemCount", "You can order min 1 item!",
            backgroundColor: AppColors.mainColor, colorText: Colors.white);
      } else {
        _quantity--;
      }
    }
    update();
  }

  void initItems() {
    _quantity = 1;
  }
}