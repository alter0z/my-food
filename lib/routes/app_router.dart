import 'package:get/get.dart';
import 'package:my_food/pages/food/popular_food_detail.dart';
import 'package:my_food/pages/food/recommended_food_detail.dart';
import 'package:my_food/pages/home/main_food_page.dart';

class AppRouter {
  static const String initial = "/";
  static init() => initial;
  static const String popularFood = "/popular-food";
  static getPopularFood(int index) => popularFood+"?index=$index";
  static const String recommendedFood = "/recommended-food";
  static getRecommendedFood(int index) => recommendedFood+"?index=$index";

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const MainFoodPage(), transition: Transition.leftToRight),
    GetPage(name: popularFood, page: () {
      var index = Get.parameters['index'];
      return PopularFoodDetail(index: int.parse(index!));
    }, transition: Transition.zoom),
    GetPage(name: recommendedFood, page: () {
      var index = Get.parameters['index'];
      return RecommendedFoodDetail(index: int.parse(index!));
    }, transition: Transition.downToUp)
  ];
}