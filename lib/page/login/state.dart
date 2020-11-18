import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_married/bean/country_code.dart';
import 'package:flutter_married/utils/sp_util.dart';

class LoginState implements Cloneable<LoginState> {
  bool isShowPwd = false;
  bool isVistor = false;
  bool isVerityCodeLogin = false;
  int countDownTime = 60;
  TextEditingController phoneEditController;
  TextEditingController pwdEditController;
  Timer timer;

  ///国际区号
  CountryCode code;

  @override
  LoginState clone() {
    return LoginState()
      ..code = code
      ..timer = timer
      ..countDownTime = countDownTime
      ..isVerityCodeLogin = isVerityCodeLogin
      ..isVistor = isVistor
      ..isShowPwd = isShowPwd
      ..phoneEditController = phoneEditController
      ..pwdEditController = pwdEditController;
  }
}

LoginState initState(Map<String, dynamic> args) {
  LoginState state = LoginState();
  return state;
}
