import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class LoginState implements Cloneable<LoginState> {
  bool isShowPwd = false;
  bool isVistor = false;
  bool isVerityCodeLogin = false;
  int countDownTime = 60;
  TextEditingController phoneEditController;
  TextEditingController pwdEditController;
  Timer timer;

  @override
  LoginState clone() {
    return LoginState()
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
  return LoginState();
}
