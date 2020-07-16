import 'package:animated_widgets/animated_widgets.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(LoginState state, Dispatch dispatch, ViewService viewService) {
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
                if (state.isVistor) {
                  dispatch(LoginActionCreator.onIsVistor());
                } else {
//                  SystemNavigator.pop();
                  Navigator.of(viewService.context).pop();
                }
              },
            ),
            actions: <Widget>[
              OpacityAnimatedWidget.tween(
                opacityEnabled: 1,
                //define start value
                opacityDisabled: 0,
                //and end value
                enabled: !state.isVistor,
                //bind with the boolean
                duration: Duration(milliseconds: 300),
                // bind with the boolean
                child: GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    child:
                        Image.asset('assets/icon_btn_register.png', width: 77),
                  ),
                  onTap: () {
                    FocusScope.of(viewService.context).requestFocus(FocusNode());
                    Navigator.of(viewService.context)
                        .pushNamed('register_page');
                  },
                ),
              ),
            ],
          ),
          TranslationAnimatedWidget.tween(
            enabled: state.isVistor,
            duration: Duration(milliseconds: 300),
            translationDisabled: Offset(0, 200),
            translationEnabled: Offset(0, 0),
            child: OpacityAnimatedWidget.tween(
              enabled: state.isVistor,
              opacityDisabled: 0,
              opacityEnabled: 1,
              duration: Duration(milliseconds: 300),
              child: Container(
                margin: EdgeInsets.only(top: 177.5),
                child: Column(
                  children: <Widget>[
                    Text(
                      '请选择您的性别',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 105,
                          height: 143,
                          child: Image.asset('assets/icon_splash_male.png'),
                        ),
                        SizedBox(
                          width: 46.5,
                        ),
                        Container(
                          width: 105,
                          height: 143,
                          child: Image.asset('assets/icon_splash_female.png'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          OpacityAnimatedWidget.tween(
            opacityEnabled: 1,
            //define start value
            opacityDisabled: 0,
            //and end value
            enabled: !state.isVistor,
            duration: Duration(milliseconds: 300),
            // bind with the boolean
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      '登录',
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
                                margin: EdgeInsets.only(
                                    left: 25, top: 75, right: 25),
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: GestureDetector(
                                          child: TextField(
                                            controller: state.pwdEditController,
                                            cursorColor: Colors.white,
                                            maxLines: 1,
                                            enabled: false,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: state.code == null?'中国':state.code.cn,
                                                hintStyle: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white)),
                                          ),
                                          onTap: () {},
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 11),
                                        child: Text(
                                          state.code == null?'+86':state.code.phoneCode,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
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
                                  onTap: () {
                                    Navigator.of(viewService.context).pushNamed(
                                        'countrycode_page',
                                        arguments: {
                                          'code': state.code == null
                                              ? '+86'
                                              : state.code.phoneCode
                                        }).then((value) {
                                          dispatch(LoginActionCreator.onChangeCountryCode(value));
                                    });
                                  },
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
                                      child:
                                          Image.asset('assets/icon_phone.png'),
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
                                margin: EdgeInsets.only(
                                    left: 21, top: 14, right: 25),
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
                                            LoginActionCreator.onIsShowPwd());
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
                                margin: EdgeInsets.only(
                                    left: 21, top: 14, right: 25),
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
                                          dispatch(LoginActionCreator
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
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                child: Text(
                                  !state.isVerityCodeLogin ? '验证码登录' : '帐号密码登录',
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xffF92431)),
                                ),
                                onTap: () {
                                  dispatch(
                                      LoginActionCreator.onIsVerityCodeLogin());
                                },
                                behavior: HitTestBehavior.opaque,
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Text(
                                '忘记密码',
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xffF92431)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 25, top: 28, right: 25),
                          child: Column(
                            children: <Widget>[
                              GestureDetector(
                                child: Image.asset('assets/icon_login.png'),
                                onTap: () {},
                              ),
                              Divider(
                                height: 18.5,
                              ),
                              GestureDetector(
                                child:
                                    Image.asset('assets/icon_wechat_login.png'),
                                onTap: () {},
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
          ),
          OpacityAnimatedWidget.tween(
            opacityEnabled: 1,
            //define start value
            opacityDisabled: 0,
            //and end value
            enabled: !state.isVistor,
            //
            duration: Duration(milliseconds: 300),
            // bind with the boolean
            child: GestureDetector(
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: 62),
                child: Text(
                  '随便看看',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              onTap: () {
                FocusScope.of(viewService.context).requestFocus(FocusNode());
                dispatch(LoginActionCreator.onIsVistor());
              },
            ),
          ),
        ],
      ),
    ),
  );
}
