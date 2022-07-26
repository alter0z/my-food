import 'package:get/get.dart';
import 'package:my_food/data/api/api_client.dart';

import '../../controllers/popular_ product_controller.dart';
import '../../data/repositories/pupular_product_repo.dart';

Future<void> init()async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://www.ansorisan.com"));

  // repositories
  Get.lazyPut(() => PupularProductRepo(apiClient: Get.find()));

  // controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}