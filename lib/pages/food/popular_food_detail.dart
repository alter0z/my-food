import 'package:flutter/material.dart';
import 'package:my_food/utils/dimensions.dart';
import 'package:my_food/widgets/app_column.dart';
import 'package:my_food/widgets/app_icon.dart';
import 'package:my_food/widgets/expanable_text_widget.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(left: 0, right: 0, child: Container(
            width: double.maxFinite,
            height: Dimensions.popuarFoodImgSize,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/food0.png")
              )
            ),
          )),
          Positioned(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height45, child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(icon: Icons.arrow_back_ios_new_rounded),
              AppIcon(icon: Icons.shopping_cart_outlined)
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
                AppColumn(text: "Mitarashi Dango", fs: Dimensions.font26,),
                SizedBox(height: Dimensions.height20,),
                BigText(text: "Introduce"),
                SizedBox(height: Dimensions.height20,),
                const Expanded(child: SingleChildScrollView(child: ExpanableTExtWidget(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam at porttitor dolor, vitae faucibus orci. Nunc suscipit, ipsum ut viverra pulvinar, justo metus dapibus tortor, a convallis justo mi sit amet odio. Nam sed libero vel nunc varius consectetur. Donec viverra aliquet luctus. Duis fermentum libero ut turpis porta aliquam. Cras sit amet mauris ut erat pretium auctor. Duis bibendum vitae sapien vitae molestie. Morbi malesuada magna et dui tempus, quis bibendum tortor maximus. Maecenas efficitur dui erat, in tincidunt erat vehicula non. Morbi suscipit pulvinar dui, vel egestas risus mollis in. Maecenas maximus urna ac nulla varius condimentum. Sed in varius neque, ut condimentum quam. Cras elementum cursus nisl quis tempor.")))
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
              child: BigText(text: "\$10 | Add to cart", color: Colors.white),
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
