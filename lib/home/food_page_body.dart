import 'package:flutter/material.dart';
import 'package:my_food/widgets/big_text.dart';
import 'package:my_food/widgets/icon_and_text_widget.dart';
import 'package:my_food/widgets/small_text.dart';

import '../utils/colors.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final _scaleFactor = 0.8;
  final _height = 220;

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
    return Container(
      height: 320,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context,position) {
        return _buildPageItem(position);
      }),
    );
  }

  Widget _buildPageItem(int index) {
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
          Container(
            height: 220,
            margin: const EdgeInsets.only(right: 10,left: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven ? const Color(0xff69c5df) : const Color(0xff9294cc),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "assets/image/food13.png"
                    )
                )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: const EdgeInsets.only(right: 30,left: 30, bottom: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
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
                padding: const EdgeInsets.only(left: 15,top: 15,right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Mitarashi Dango"),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) => Icon(Icons.star, color: AppColors.mainColor, size:15)),
                        ),
                        const SizedBox(width: 10,),
                        SmallText(text: "4.5"),
                        const SizedBox(width: 10,),
                        SmallText(text: "1287"),
                        const SizedBox(width: 3,),
                        SmallText(text: "comments")
                      ],
                    ),
                    const SizedBox(height: 20,),
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
    );
  }
}
