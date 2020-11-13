import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_married/widgets/widget_horizontal_view.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    AccountSafeState state, Dispatch dispatch, ViewService viewService) {
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
          behavior: HitTestBehavior.opaque,
          child: CommonHorizontalView(
            text: '修改密码',
            showLeftIcon: false,
          ),
          onTap: () {
            Navigator.of(viewService.context)
                .pushNamed('edit_password')
                .then((value) {
              dispatch(AccountSafeActionCreator.onGetUserInfo());
            });
          },
        ),
        Divider(
          height: 1,
          indent: 15,
          endIndent: 15,
          color: Color(0xffeeeeee),
        ),
        CommonHorizontalView(
          text: '绑定微信',
          showLeftIcon: false,
          rightText: state.basicInfo != null && state.basicInfo.weChat != null
              ? '${state.basicInfo.weChat}'
              : '未绑定',
          showRightText: true,
        ),
        Divider(
          height: 1,
          indent: 15,
          endIndent: 15,
          color: Color(0xffeeeeee),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: CommonHorizontalView(
            text: '修改手机号',
            showLeftIcon: false,
            rightText:
                (state.basicInfo != null && state.basicInfo.phone != null)
                    ? '${state.basicInfo.phone}'
                    : '',
            showRightText: true,
          ),
          onTap: () {
            Navigator.of(viewService.context)
                .pushNamed('edit_phone')
                .then((value) {
              dispatch(AccountSafeActionCreator.onGetUserInfo());
            });
          },
        ),
      ],
    ),
  );
}
