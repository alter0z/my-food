import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_food/controllers/popular_%20product_controller.dart';
import 'package:my_food/controllers/recommended_%20product_controller.dart';
import 'package:my_food/models/product_model.dart';
import 'package:my_food/pages/food/popular_food_detail.dart';
import 'package:my_food/routes/app_router.dart';
import 'package:my_food/utils/app_constants.dart';
import 'package:my_food/utils/dimensions.dart';
import 'package:my_food/widgets/big_text.dart';
import 'package:my_food/widgets/icon_and_text_widget.dart';
import 'package:my_food/widgets/small_text.dart';
import 'package:my_food/widgets/small_text_desc.dart';

import '../../utils/colors.dart';
import '../../widgets/app_column.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final _scaleFactor = 0.8;
  final _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider section
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return Container(
            height: Dimensions.pageView,
            child: PageView.builder(
              controller: pageController,
              itemCount: popularProducts.popularProductList.length,
              itemBuilder: (context,position) {
                return _buildPageItem(position, popularProducts.popularProductList[position], popularProducts.isLoaded);
              }
            ),
          );
        }),
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty ? 1 : popularProducts.popularProductList.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                activeColor: AppColors.mainColor
            ),
          );
        }),
        // popular text
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".",color: const Color(0xFFccc7c5),),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food Pairing ",),
              )
            ],
          ),
        ),
        // list food
        GetBuilder<RecommendedProductController>(builder: (recommendedProducts) {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: recommendedProducts.recommendedProductList.length, itemBuilder: (context, index) {
              ProductModel recommendedProduct = recommendedProducts.recommendedProductList[index];
            return GestureDetector(
              onTap: () {
                Get.toNamed(AppRouter.getRecommendedFood(index));
              },
              child: Container(
                margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height20),
                child: Row(
                  children: [
                    // food image
                    Container(
                      width: Dimensions.listViewImageSize,
                      height: Dimensions.listViewImageSize,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white24,
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0xffe8e8e8),
                                blurRadius: 5.0,
                                offset: Offset(0, 5)
                            ),
                          ],
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  AppConstants.baseImageUrl+recommendedProduct.img!
                              )
                          )
                      ),
                    ),
                    // food info
                    Expanded(
                      child: Container(
                        height: Dimensions.listViewTextContSize,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius20),
                            ),
                            color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0xffe8e8e8),
                                blurRadius: 5.0,
                                offset: Offset(0, 5)
                            ),
                          ]
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(text: recommendedProduct.name!),
                              SizedBox(height: Dimensions.height10,),
                              SmallTextDesc(text: recommendedProduct.description!),
                              SizedBox(height: Dimensions.height10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconAndTextWidget(icon: Icons.circle_sharp,
                                      text: "Normal",
                                      iconColor: AppColors.iconColor1
                                  ),
                                  IconAndTextWidget(icon: Icons.location_on,
                                      text: "1.7km",
                                      iconColor: AppColors.mainColor
                                  ),
                                  IconAndTextWidget(icon: Icons.access_time_rounded,
                                      text: "32min",
                                      iconColor: AppColors.iconColor2
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          });
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct, bool isLoaded) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1-(_currentPageValue-index)*(1-_scaleFactor);
      var currentTrans = _height*(1-currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor()+1) {
      var currentScale = _scaleFactor+(_currentPageValue-index+1)*(1-_scaleFactor);
      var currentTrans = _height*(1-currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor()-1) {
      var currentScale = 1-(_currentPageValue-index)*(1-_scaleFactor);
      var currentTrans = _height*(1-currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currentScale = _scaleFactor;
      var currentTrans = _height*(1-currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTrans, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRouter.getPopularFood(index));
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(right: Dimensions.width10,left: Dimensions.width10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: const Color(0xffd5d5d5),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          isLoaded ? AppConstants.baseImageUrl+popularProduct.img! : "https://cdn-icons-png.flaticon.com/512/3176/3176387.png"
                      )
                  )
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(right: Dimensions.width30,left: Dimensions.width30, bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xffe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)
                    ),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(-5, 0)
                    ),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(5, 0)
                    )
                  ]
              ),
              child: Container(
                padding: EdgeInsets.only(left: 15,top: Dimensions.height15,right: 15),
                child: AppColumn(text: popularProduct.name!,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
