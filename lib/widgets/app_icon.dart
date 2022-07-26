import 'package:flutter/cupertino.dart';
import 'package:my_food/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroudColor;
  final Color iconColor;
  final double size;
  final double iconSize;
  const AppIcon({Key? key,
    required this.icon,
    this.backgroudColor = const Color(0xfffcf4e4),
    this.iconColor = const Color(0xff756d54),
    this.size = 40,
    this.iconSize = 16}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroudColor
      ),
      child: Icon(icon, color: iconColor, size: iconSize,),
    );
  }
}
