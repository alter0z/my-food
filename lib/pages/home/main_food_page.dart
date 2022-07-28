import 'package:flutter/material.dart';
import 'package:my_food/pages/home/food_page_body.dart';
import 'package:my_food/utils/colors.dart';
import 'package:my_food/utils/dimensions.dart';
import 'package:my_food/widgets/big_text.dart';

import '../../widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45,bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Japan", color: AppColors.mainColor),
                      Row(
                        children: [
                          SmallText(text: "Kyoto",color: AppColors.mainBlackColor),
                          const Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      child:  Icon(Icons.search,color: Colors.white,size: Dimensions.icon24,),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.mainColor,
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xffe8e8e8),
                              blurRadius: 5.0,
                              offset: Offset(0, 5)
                          ),
                        ]
                      ),
                    ),
                  )
                ],
              ),
            )
          ),
          const Expanded(child: SingleChildScrollView(child: FoodPageBody()))
        ],
      ),
    );
  }
}
