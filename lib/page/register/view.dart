import 'package:dotted_border/dotted_border.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    RegisterState state, Dispatch dispatch, ViewService viewService) {
  return SafeArea(
    child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/icon_login_bg.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: ImageIcon(AssetImage('assets/icon_back.png')),
              color: Colors.white,
              onPressed: () {
                Navigator.of(viewService.context).pop();
              },
            ),
            actions: <Widget>[
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  child:
                      Image.asset('assets/icon_have_register.png', width: 118),
                ),
                onTap: () {
                  Navigator.of(viewService.context).pop();
                },
              ),
            ],
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    '注册',
                    style: TextStyle(fontSize: 27, color: Colors.white),
                  ),
                  margin: EdgeInsets.only(top: 88, left: 25),
                  alignment: Alignment.topLeft,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Visibility(
                        visible: state.isVerityCodeLogin,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin:
                                  EdgeInsets.only(left: 25, top: 70, right: 25),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: GestureDetector(
                                      behavior:HitTestBehavior.opaque,
                                      child: TextField(
                                        controller: TextEditingController(),
                                        readOnly: true,
                                        cursorColor: Colors.white,
                                        maxLines: 1,
                                        enabled: false,
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: state.code == null?'中国':state.code.cn,
                                            hintStyle: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white)),
                                      ),
                                      onTap: (){
                                        Navigator.of(viewService.context).pushNamed(
                                            'countrycode_page',
                                            arguments: {
                                              'code': state.code == null
                                                  ? '+86'
                                                  : state.code.phoneCode
                                            }).then((value) {
                                          dispatch(RegisterActionCreator.onChangeCountryCode(value));
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 11),
                                    child: Text(
                                      state.code == null?'+86':state.code.phoneCode,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: 10,
                                    height: 18,
                                    child: Image.asset(
                                        'assets/icon_arrow_right.png'),
                                  ),
                                ],
                              ),
                            ),
                            Opacity(
                              opacity: 0.8,
                              child: Divider(
                                height: 0.5,
                                color: Colors.white,
                                indent: 25,
                                endIndent: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: true,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: state.isVerityCodeLogin
                                  ? EdgeInsets.only(
                                      left: 21, top: 14, right: 25)
                                  : EdgeInsets.only(
                                      left: 21, top: 75, right: 25),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 11),
                                    child: Image.asset('assets/icon_phone.png'),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: state.phoneEditController,
                                      cursorColor: Colors.white,
                                      maxLines: 1,
                                      keyboardType: state.isVerityCodeLogin
                                          ? TextInputType.phone
                                          : TextInputType.text,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: state.isVerityCodeLogin
                                              ? '请输入手机号'
                                              : '请输入手机号或昵称',
                                          hintStyle: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Opacity(
                              opacity: 0.8,
                              child: Divider(
                                height: 0.5,
                                color: Colors.white,
                                indent: 25,
                                endIndent: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: !state.isVerityCodeLogin,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin:
                                  EdgeInsets.only(left: 21, top: 14, right: 25),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 11),
                                    child: Image.asset('assets/icon_pwd.png'),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: state.pwdEditController,
                                      cursorColor: Colors.white,
                                      maxLines: 1,
                                      obscureText: !state.isShowPwd,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '请输入密码',
                                          hintStyle: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white)),
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      child: Image.asset(state.isShowPwd
                                          ? 'assets/icon_visible_pwd.png'
                                          : 'assets/icon_hide_pwd.png'),
                                    ),
                                    onTap: () {
                                      dispatch(
                                          RegisterActionCreator.onIsShowPwd());
                                    },
                                    behavior: HitTestBehavior.opaque,
                                  ),
                                ],
                              ),
                            ),
                            Opacity(
                              opacity: 0.8,
                              child: Divider(
                                height: 0.5,
                                color: Colors.white,
                                indent: 25,
                                endIndent: 25,
                              ),
                            )
                          ],
                        ),
                      ),
                      Visibility(
                        visible: state.isVerityCodeLogin,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin:
                                  EdgeInsets.only(left: 21, top: 14, right: 25),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 11),
                                    child: Image.asset(
                                        'assets/icon_verity_code.png'),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: state.pwdEditController,
                                      cursorColor: Colors.white,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '请输入验证码',
                                          hintStyle: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white)),
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      child: Text(
                                        state.countDownTime == 60
                                            ? '获取验证码'
                                            : state.countDownTime != -1
                                                ? '${state.countDownTime}s后重新获取'
                                                : '重新获取',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xffF92431)),
                                      ),
                                    ),
                                    onTap: () {
                                      if (state.countDownTime == 60 ||
                                          state.countDownTime == -1) {
                                        dispatch(RegisterActionCreator
                                            .onGetVerityCode());
                                      }
                                    },
                                    behavior: HitTestBehavior.opaque,
                                  ),
                                ],
                              ),
                            ),
                            Opacity(
                              opacity: 0.8,
                              child: Divider(
                                height: 0.5,
                                color: Colors.white,
                                indent: 25,
                                endIndent: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 21, top: 14, right: 25),
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          child: Text(
                            !state.isVerityCodeLogin ? '验证码登录' : '帐号密码登录',
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffF92431)),
                          ),
                          onTap: () {
                            dispatch(
                                RegisterActionCreator.onIsVerityCodeLogin());
                          },
                          behavior: HitTestBehavior.opaque,
                        ),
                      ),

                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 25,top: 30,bottom: 14.5),
                        child: Text('选择性别，选择后无法改变',style: TextStyle(fontSize: 14,color: Colors.white),),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 25, right: 25,bottom: 14.5),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: GestureDetector(
                                child: Stack(
                                  alignment: Alignment.centerRight,
                                  children: <Widget>[
                                    Container(
                                      height: 42,
                                      child: Image.asset('assets/icon_select_male.png'),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      width: 17,
                                      height: 12.5,
                                      child: Visibility(
                                        visible: state.isMale,
                                        child: Container(
                                          child: Image.asset('assets/icon_select.png'),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                                onTap: (){
                                  dispatch(RegisterActionCreator.onIsMale(true));
                                },
                              ),
                            ),
                            SizedBox(width: 15,),
                            Expanded(
                              child: GestureDetector(
                                child: Stack(
                                  alignment: Alignment.centerRight,
                                  children: <Widget>[
                                    Container(
                                      height: 42,
                                      child: Image.asset('assets/icon_select_female.png'),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      width: 17,
                                      height: 12.5,
                                      child: Visibility(
                                        visible: !state.isMale,
                                        child: Container(
                                          child: Image.asset('assets/icon_select.png'),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                                onTap: (){
                                  dispatch(RegisterActionCreator.onIsMale(false));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 25, right: 25),
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              child: Image.asset(
                                  'assets/icon_register_forward.png'),
                              onTap: () {
                                FocusScope.of(viewService.context).requestFocus(FocusNode());
                                dispatch(RegisterActionCreator.onRegister());
                              },
                            ),
                            Divider(
                              height: 9,
                            ),
                            RichText(
                              text: TextSpan(
                                text: '注册表示同意',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '《真爱有缘服务条款》',
                                    style: TextStyle(fontSize: 12,color: Color(0xffF92431)),
                                    recognizer: TapGestureRecognizer()..onTap = (){
                                      FocusScope.of(viewService.context).requestFocus(FocusNode());
                                    },
                                  ),
                                  TextSpan(
                                    text: '及',
                                    style: TextStyle(fontSize: 12,color: Colors.white),
                                  ),
                                  TextSpan(
                                    text: '《真爱有缘隐私保护政策》',
                                    style: TextStyle(fontSize: 12,color: Color(0xffF92431)),
                                    recognizer: TapGestureRecognizer()..onTap = (){
                                      FocusScope.of(viewService.context).requestFocus(FocusNode());
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
