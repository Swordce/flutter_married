import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    EditPhoneState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Color(0xfff5f5f5),
    appBar: AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        '修改手机号',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
      leading: IconButton(
        icon: ImageIcon(AssetImage('assets/icon_back.png')),
        color: Colors.white,
        onPressed: () {
          Navigator.of(viewService.context).pop();
        },
      ),
      actions: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Container(
            child: Text(
              '保存',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 15),
          ),
          onTap: () {
            dispatch(EditPhoneActionCreator.onSave());
          },
        ),
      ],
    ),
    body: ListView(
      children: [
        Container(
          height: 48,
          color: Colors.white,
          padding: EdgeInsets.only(left: 15, right: 15),
          child: TextField(
            controller: state.phoneController,
            maxLines: 1,
            style: TextStyle(color: Color(0xff333333)),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '请输入手机号',
                hintStyle: TextStyle(fontSize: 16, color: Color(0xff666666))),
          ),
        ),
        Divider(
          color: Color(0xffeeeeee),
          height: 1,
        ),
        Container(
          color: Colors.white,
          child: Row(
            children: [
              Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: TextField(
                      controller: state.smsCodeController,
                      maxLines: 1,
                      style: TextStyle(color: Color(0xff333333)),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '请输入验证码',
                          hintStyle: TextStyle(
                              fontSize: 16, color: Color(0xff666666))),
                    ),
                  )),
             GestureDetector(
               behavior: HitTestBehavior.opaque,
               child:  Container(
                 color: Colors.white,
                 margin: EdgeInsets.only(right: 15),
                 child: Text(state.countDownTime == 60
                     ? '获取验证码'
                     : state.countDownTime != -1
                     ? '${state.countDownTime}s后重新获取'
                     : '重新获取',style: TextStyle(color: Color(0xff333333),fontSize: 15),),
               ),
               onTap: () {
                 dispatch(EditPhoneActionCreator.onGetSmsCode());
               },
             )
            ],
          ),
        ),
      ],
    ),
  );
}
