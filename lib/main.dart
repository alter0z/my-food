import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_food/controllers/popular_%20product_controller.dart';
import 'package:my_food/controllers/recommended_%20product_controller.dart';
import 'package:my_food/pages/food/recommended_food_detail.dart';
import 'package:my_food/pages/home/food_page_body.dart';
import 'package:my_food/pages/home/main_food_page.dart';
import 'package:my_food/routes/app_router.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainFoodPage(),
      initialRoute: AppRouter.initial,
      getPages: AppRouter.routes,
    );
  }
}