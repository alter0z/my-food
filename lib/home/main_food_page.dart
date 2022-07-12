import 'package:flutter/material.dart';
import 'package:my_food/home/food_page_body.dart';
import 'package:my_food/utils/colors.dart';
import 'package:my_food/widgets/big_text.dart';

import '../widgets/small_text.dart';

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
              margin: const EdgeInsets.only(top: 49,bottom: 15),
              padding: const EdgeInsets.only(left: 20,right: 20),
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
                      width: 45,
                      height: 45,
                      child: const Icon(Icons.search,color: Colors.white,),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.mainColor
                      ),
                    ),
                  )
                ],
              ),
            )
          ),
          const FoodPageBody()
        ],
      ),
    );
  }
}
