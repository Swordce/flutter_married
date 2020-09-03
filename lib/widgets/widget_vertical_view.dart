import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommonVerticalView extends StatelessWidget {
  final String iconPath;
  final double iconWidth;
  final double iconHeight;

  final String text;
  final double fontSize;
  final int textColor;

  final double spacing;

  final VoidCallback onPressed;

  CommonVerticalView(
      {Key key,
      @required this.iconPath,
      this.iconWidth = 36,
      this.iconHeight = 36,
      @required this.text,
      this.fontSize = 13,
      this.textColor = 0xff333333,
      this.spacing = 10,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: GestureDetector(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              iconPath,
              width: iconWidth,
              height: iconHeight,
            ),
            SizedBox(
              height: spacing,
            ),
            Container(
              child: Text(
                text,
                style: TextStyle(color: Color(textColor), fontSize: fontSize),
              ),
            ),
          ],
        ),
        onTap: onPressed,
      ),
    );
  }
}
