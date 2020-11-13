import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(EditPasswordState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Color(0xfff5f5f5),
    appBar: AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        '修改密码',
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
            child: Text('保存',style: TextStyle(color: Colors.white,fontSize: 15),),
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 15),
          ),
          onTap: () {
            dispatch(EditPasswordActionCreator.onSavePwd());
          },
        ),
      ],
    ),
    body: ListView(
      children: [
        Container(
          height: 48,
          color: Colors.white,
          padding: EdgeInsets.only(left: 15,right: 15),
          child: TextField(
            controller: state.oldPwdController,
            maxLines: 1,
            obscureText: true,
            style: TextStyle(color: Color(0xff333333)),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '请输入旧密码',
                hintStyle: TextStyle(
                    fontSize: 16,
                    color: Color(0xff666666))),
          ),
        ),
        Divider(color: Color(0xffeeeeee),height: 1,),
        Container(
          height: 48,
          color: Colors.white,
          padding: EdgeInsets.only(left: 15,right: 15),
          child: TextField(
            controller: state.newPwdController,
            maxLines: 1,
            obscureText: true,
            style: TextStyle(color: Color(0xff333333)),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '请输入新密码',
                hintStyle: TextStyle(
                    fontSize: 16,
                    color: Color(0xff666666))),
          ),
        ),
      ],
    ),
  );
}
