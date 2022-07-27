import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_food/controllers/popular_%20product_controller.dart';
import 'package:my_food/models/product_model.dart';
import 'package:my_food/pages/home/main_food_page.dart';
import 'package:my_food/routes/app_router.dart';
import 'package:my_food/utils/app_constants.dart';
import 'package:my_food/utils/dimensions.dart';
import 'package:my_food/widgets/app_column.dart';
import 'package:my_food/widgets/app_icon.dart';
import 'package:my_food/widgets/expanable_text_widget.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';

class PopularFoodDetail extends StatelessWidget {
  int index;
  PopularFoodDetail({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var popularProducts = Get.find<PopularProductController>().popularProductList[index];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(left: 0, right: 0, child: Container(
            width: double.maxFinite,
            height: Dimensions.popuarFoodImgSize,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(AppConstants.baseImageUrl+popularProducts.img!)
              )
            ),
          )),
          Positioned(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height45, child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRouter.init());
                },
                child: const AppIcon(icon: Icons.arrow_back_ios_new_rounded)
              ),
              const AppIcon(icon: Icons.shopping_cart_outlined)
            ],
          )),
          Positioned(left: 0, right: 0, top: Dimensions.popuarFoodImgSize-20, bottom: 0, child: Container(
            padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius20), topRight: Radius.circular(Dimensions.radius20)),
              color: Colors.white
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppColumn(text: popularProducts.name!, fs: Dimensions.font26,),
                SizedBox(height: Dimensions.height20,),
                BigText(text: "Introduce"),
                SizedBox(height: Dimensions.height20,),
                Expanded(child: SingleChildScrollView(child: ExpanableTextWidget(text: popularProducts.description!)))
              ],
            )
          ))
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomBarHeight,
        padding: EdgeInsets.only(
          top: Dimensions.height30, bottom: Dimensions.height30, right: Dimensions.width20, left: Dimensions.width20
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.radius20*2), topLeft: Radius.circular(Dimensions.radius20*2)),
          color: AppColors.buttonBackgroundColor
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xffe8e8e8),
                    blurRadius: 8.0,
                    offset: Offset(0, 5)
                  ),
                ]
              ),
              child: Row(
                children: [
                  Icon(Icons.remove, color: AppColors.signColor,),
                  SizedBox(width: Dimensions.width10/2,),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width10/2,),
                  Icon(Icons.add, color: AppColors.signColor,)
                ],
              ),
            ),
            Container(
              child: BigText(text: "\$${popularProducts.price!} | Add to cart", color: Colors.white),
              padding: EdgeInsets.only(
                  top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xffe8e8e8),
                    blurRadius: 8.0,
                    offset: Offset(0, 5)
                  ),
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}
