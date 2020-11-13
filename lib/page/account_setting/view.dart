import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_married/widgets/widget_horizontal_view.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(AccountSettingState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Color(0xfff5f5f5),
    appBar: AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        '设置',
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
    body: ListView(
      children: [
        GestureDetector(
          child: CommonHorizontalView(text: '账号与安全',showLeftIcon: false,),
          behavior: HitTestBehavior.opaque,
          onTap: (){
            Navigator.of(viewService.context).pushNamed('account_safe');
          },
        ),
        SizedBox(height: 10,),
        CommonHorizontalView(text: '常见问题',showLeftIcon: false,),
        Divider(height: 1,indent: 15,endIndent: 15,color: Color(0xffeeeeee),),
        CommonHorizontalView(text: '关于我们',showLeftIcon: false,),
        SizedBox(height: 10,),
        CommonHorizontalView(text: '清除缓存',showLeftIcon: false,rightText:'0B',showRightText: true,),
        Divider(height: 1,indent: 15,endIndent: 15,color: Color(0xffeeeeee),),
        CommonHorizontalView(text: '检测更新',showLeftIcon: false,rightText:'已是最新版',showRightText: true,),
      ],
    ),
  );
}
