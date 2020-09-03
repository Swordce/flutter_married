import 'dart:ffi';

import 'package:flutter/widgets.dart';

class CommonHorizontalView extends StatelessWidget {

  final double height;
  final double width;
  final EdgeInsetsGeometry padding;

  //左边图标属性
  final String iconPath;
  final double iconWidth;
  final double iconHeight;

  //左边文本属性
  final String text;
  final double textSize;
  final int textColor;

  //右边文本属性
  final bool showRightText;
  final String rightText;
  final int rightTextColor;
  final double rightTextSize;

  //是否展示方向图标
  final bool showRightArrow;

  //图标与文本的距离
  final double spacing;

  final VoidCallback onPressed;

  CommonHorizontalView(
      {Key key,
      this.height = 48,
      this.width = double.infinity,
      this.padding = const EdgeInsets.only(left: 15,right: 15),
      @required this.iconPath,
      this.iconWidth = 18,
      this.iconHeight = 18,
      @required this.text,
      this.textSize = 15,
      this.textColor = 0xff333333,
      this.showRightText = false,
      this.rightText = '',
      this.rightTextColor = 0xff999999,
      this.rightTextSize = 15,
      this.showRightArrow = true,
      this.spacing = 10, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Padding(
        padding: padding,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onPressed,
          child: Row(
            children: <Widget>[
              Image.asset(
                iconPath,
                width: iconWidth,
                height: iconHeight,
              ),
              SizedBox(
                width: spacing,
              ),
              Text(
                text,
                style: TextStyle(color: Color(textColor), fontSize: textSize),
              ),
              Flexible(
                child: Container(),
              ),
              Visibility(
                visible: showRightText,
                child: Text(
                  rightText,
                  style: TextStyle(color: Color(rightTextColor), fontSize: rightTextSize),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Visibility(
                visible: showRightArrow,
                child: Image.asset(
                  'assets/2.0x/icon_user_arrow.png',
                  width: 18,
                  height: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
