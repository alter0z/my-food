import 'package:flutter/cupertino.dart';
import 'package:my_food/utils/dimensions.dart';
import 'package:my_food/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconAndTextWidget({Key? key, required this.icon, required this.text, required this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: Dimensions.icon24, shadows: const [
          BoxShadow(
              color: Color(0xffe8e8e8),
              blurRadius: 10.0,
              offset: Offset(0, 5)
          ),
        ],),
        const SizedBox(width: 5,),
        SmallText(text: text,)
      ],
    );
  }
}
