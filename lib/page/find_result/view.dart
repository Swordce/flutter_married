import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_married/widgets/common_item.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(FindResultState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        state.isRandom?'随机匹配':'精准匹配',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
      leading: IconButton(
        icon: ImageIcon(AssetImage('assets/icon_back.png')),
        color: Colors.white,
        onPressed: () {
          Navigator.of(viewService.context).pop();
        },
      ),
    ),
    body: Column(
      children: <Widget>[
        Visibility(
          visible: true,
          child: GestureDetector(
            child: Container(
              height: 55,
              color: Color(0xffFFF9ED),
              padding: EdgeInsets.only(left: 15,right: 15),
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  text: '当前有',
                  style: TextStyle(
                      fontSize: 12, color: Color(0xff333333)),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' 10000+ ',
                      style: TextStyle(fontSize: 12,color: Color(0xffF92431)),

                    ),
                    TextSpan(
                      text: '位匹配对象在等你',
                      style: TextStyle(fontSize: 12,color: Color(0xff333333)),
                    ),
                  ],
                  recognizer: TapGestureRecognizer()..onTap = (){

                  }
                ),
              ),
            ),
            onTap: () {},
          ),
        ),

        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CommonItem(context, index,isShowOverlayEntry: false,);
              },
              separatorBuilder: (context, index) {
                return Container(
                  color: Color(0xfff5f5f5),
                  height: 10.5,
                );
              },
              itemCount: 100),
        )
      ],
    ),
  );
}
