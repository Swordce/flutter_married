import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class EditPhoneState implements Cloneable<EditPhoneState> {

  TextEditingController phoneController = TextEditingController();
  TextEditingController smsCodeController = TextEditingController();

  int countDownTime = 60;
  Timer timer;

  @override
  EditPhoneState clone() {
    return EditPhoneState()..phoneController = phoneController..smsCodeController = smsCodeController..countDownTime=countDownTime..timer=timer;
  }
}

EditPhoneState initState(Map<String, dynamic> args) {
  return EditPhoneState();
}
