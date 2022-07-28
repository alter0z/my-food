import 'package:flutter/material.dart';
import 'package:my_food/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  final double fs;
  const AppColumn({Key? key, required this.text, this.fs = 20}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: fs == 0 ? Dimensions.font20 : fs,),
        SizedBox(height: Dimensions.height10,),
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) => Icon(Icons.star, color: AppColors.mainColor, size:15, shadows: const [
                BoxShadow(
                    color: Color(0xffe8e8e8),
                    blurRadius: 10.0,
                    offset: Offset(0, 5)
                ),
              ],)),
            ),
            const SizedBox(width: 10,),
            SmallText(text: "4.5"),
            const SizedBox(width: 10,),
            SmallText(text: "1287"),
            const SizedBox(width: 3,),
            SmallText(text: "comments")
          ],
        ),
        SizedBox(height: Dimensions.height20,),
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
    );
  }
}
