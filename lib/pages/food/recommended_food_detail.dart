import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_food/utils/colors.dart';
import 'package:my_food/utils/dimensions.dart';
import 'package:my_food/widgets/app_icon.dart';
import 'package:my_food/widgets/big_text.dart';
import 'package:my_food/widgets/expanable_text_widget.dart';
import 'package:my_food/widgets/small_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                child: Center(child: BigText(text: "Some Title", size: Dimensions.font26,)),
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
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/image/food0.png", width: double.maxFinite, fit: BoxFit.cover,),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                    child: const ExpanableTextWidget(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam at porttitor dolor, vitae faucibus orci. Nunc suscipit, ipsum ut viverra pulvinar, justo metus dapibus tortor, a convallis justo mi sit amet odio. Nam sed libero vel nunc varius consectetur. Donec viverra aliquet luctus. Duis fermentum libero ut turpis porta aliquam. Cras sit amet mauris ut erat pretium auctor. Duis bibendum vitae sapien vitae molestie. Morbi malesuada magna et dui tempus, quis bibendum tortor maximus. Maecenas efficitur dui erat, in tincidunt erat vehicula non. Morbi suscipit pulvinar dui, vel egestas risus mollis in. Maecenas maximus urna ac nulla varius condimentum. Sed in varius neque, ut condimentum quam. Cras elementum cursus nisl quis tempor."),
                    margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
                )

              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
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
                AppIcon(icon: Icons.remove, backgroudColor: AppColors.mainColor, iconColor: Colors.white, iconSize: Dimensions.icon24,),
                BigText(text: "\$12.88 "+" X "+"1", color: AppColors.mainBlackColor, size: Dimensions.font26,),
                AppIcon(icon: Icons.add, backgroudColor: AppColors.mainColor, iconColor: Colors.white, iconSize: Dimensions.icon24,)
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
                  child: BigText(text: "\$13 | Add to cart", color: Colors.white),
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
      ),
    );
  }
}
