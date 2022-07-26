import 'package:flutter/material.dart';
import 'package:my_food/utils/colors.dart';
import 'package:my_food/utils/dimensions.dart';
import 'package:my_food/widgets/small_text.dart';

class ExpanableTextWidget extends StatefulWidget {
  final String text;
  const ExpanableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpanableTextWidget> createState() => _ExpanableTextWidgetState();
}

class _ExpanableTextWidgetState extends State<ExpanableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool isLongText = true;
  double textHeight = Dimensions.screenHeight/5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty ? SmallText(size: Dimensions.font16, text: firstHalf) : Column(
        children: [
          SmallText(color: AppColors.textColor, size: Dimensions.font16, text: isLongText ? (firstHalf+"...") : (firstHalf+secondHalf)),
          InkWell(
            onTap: (){
              setState(() {
                isLongText = !isLongText;
              });
            },
            child: Row(
              children: [
                SmallText(text: isLongText ? "Show more" : "Show less", color: AppColors.mainColor,),
                Icon(isLongText ? Icons.arrow_drop_down : Icons.arrow_drop_up, color: AppColors.mainColor,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
