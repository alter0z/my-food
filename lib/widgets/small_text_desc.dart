import 'package:flutter/cupertino.dart';

class SmallTextDesc extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double lineSpace;
  TextOverflow overflow;
  SmallTextDesc({Key? key, this.color = const Color(0xFFccc7c5), required this.text, this.size = 12, this.lineSpace = 1.2, this.overflow = TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontFamily: 'Roboto',
        fontSize: size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
