import 'package:get/get.dart';

class Dimensions {
  // get creen size
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  // dynamic page view margin & padding
  static double pageView = screenHeight/2.64;
  static double pageViewContainer = screenHeight/3.84;
  static double pageViewTextContainer = screenHeight/7.03;

  // dynamic height margin & padding
  static double height10 = screenHeight/84.4;
  static double height15 = screenHeight/56.27;
  static double height20 = screenHeight/42.2;
  static double height30 = screenHeight/28.13;
  static double height45 = screenHeight/18.76;

  // dynamic width margin & padding
  static double width10 = screenHeight/84.4;
  static double width15 = screenHeight/56.27;
  static double width20 = screenHeight/42.2;
  static double width30 = screenHeight/28.13;

  // dynamic font size
  static double font20 = screenHeight/42.2;

  // dynamic radius size
  static double radius15 = screenHeight/56.27;
  static double radius20 = screenHeight/42.2;
  static double radius30 = screenHeight/28.13;

  // dynamic icon size
static double icon24 = screenHeight/35.17;
}