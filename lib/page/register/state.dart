import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_married/bean/country_code.dart';

class RegisterState implements Cloneable<RegisterState> {

  bool isShowPwd = false;
  bool isVerityCodeLogin = true;
  bool isMale = true;
  TextEditingController phoneEditController;
  TextEditingController pwdEditController;
  int countDownTime = 60;
  Timer timer;
  CountryCode code;


  @override
  RegisterState clone() {
    return RegisterState()
    ..code = code
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
