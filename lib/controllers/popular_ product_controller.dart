import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_food/controllers/cart_controller.dart';
import 'package:my_food/models/product_model.dart';
import 'package:my_food/utils/colors.dart';
import '../data/repositories/pupular_product_repo.dart';

class PopularProductController extends GetxController {
  final PupularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _quantity = 1;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      // print("got products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
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

  void initItems(CartController cart) {
    _quantity = 1;
    _inCartItems = 0;
    _cart = cart;
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 1;
  }
}