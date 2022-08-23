import 'package:get/get.dart';
import 'package:my_food/controllers/cart_controller.dart';
import 'package:my_food/controllers/recommended_%20product_controller.dart';
import 'package:my_food/data/api/api_client.dart';
import 'package:my_food/data/repositories/cart_repo.dart';
import 'package:my_food/data/repositories/recommended_product_repo.dart';
import 'package:my_food/utils/app_constants.dart';

import '../../controllers/popular_ product_controller.dart';
import '../../data/repositories/pupular_product_repo.dart';

Future<void> init()async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl));

  // repositories
  Get.lazyPut(() => PupularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  // controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}