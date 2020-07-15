import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class RegisterState implements Cloneable<RegisterState> {

  bool isShowPwd = false;
  bool isVerityCodeLogin = true;
  bool isMale = true;
  int countDownTime = 60;
  TextEditingController phoneEditController;
  TextEditingController pwdEditController;
  Timer timer;

  @override
  RegisterState clone() {
    return RegisterState()
      ..isMale = isMale
      ..timer = timer
      ..countDownTime = countDownTime
      ..isVerityCodeLogin = isVerityCodeLogin
      ..isShowPwd = isShowPwd
      ..phoneEditController = phoneEditController
      ..pwdEditController = pwdEditController;
  }
}

RegisterState initState(Map<String, dynamic> args) {
  return RegisterState();
}
