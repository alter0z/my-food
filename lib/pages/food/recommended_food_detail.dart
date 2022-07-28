import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_food/controllers/recommended_%20product_controller.dart';
import 'package:my_food/utils/app_constants.dart';
import 'package:my_food/utils/colors.dart';
import 'package:my_food/utils/dimensions.dart';
import 'package:my_food/widgets/app_icon.dart';
import 'package:my_food/widgets/big_text.dart';
import 'package:my_food/widgets/expanable_text_widget.dart';

import '../../routes/app_router.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int index;
  const RecommendedFoodDetail({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[index];
    Get.find<RecommendedProductController>().initItems();
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRouter.init());
                  },
                  child: const AppIcon(icon: Icons.clear)
                ),
                const AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                child: Center(child: BigText(text: product.name!, size: Dimensions.font26,)),
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20)
                  ),
                  color: Colors.white,
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.mainColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(AppConstants.baseImageUrl+product.img!, width: double.maxFinite, fit: BoxFit.cover,),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                    child: ExpanableTextWidget(text: product.description!),
                    margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
                )

              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20*2.5,
                  right: Dimensions.width20*2.5,
                  top: Dimensions.height10,
                  bottom: Dimensions.height10
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        recommendedProduct.setQuantity(false);
                      },
                      child: AppIcon(icon: Icons.remove, backgroudColor: AppColors.mainColor, iconColor: Colors.white, iconSize: Dimensions.icon24,)),
                  BigText(text: "\$${product.price!}  X ${recommendedProduct.quantity}", color: AppColors.mainBlackColor, size: Dimensions.font26,),
                  GestureDetector(
                      onTap: () {
                        recommendedProduct.setQuantity(true);
                      },
                    child: AppIcon(icon: Icons.add, backgroudColor: AppColors.mainColor, iconColor: Colors.white, iconSize: Dimensions.icon24,))
                ],
              ),
            ),
            Container(
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
                    child: Icon(Icons.favorite, color: AppColors.mainColor,shadows: const [
                      BoxShadow(
                          color: Color(0xffe8e8e8),
                          blurRadius: 8.0,
                          offset: Offset(0, 5)
                      )
                    ],),
                  ),
                  Container(
                    child: BigText(text: "\$${product.price!*recommendedProduct.quantity} | Add to cart", color: Colors.white),
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
          ],
        );
      }),
    );
  }
}
