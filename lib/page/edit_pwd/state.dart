import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_married/utils/sp_util.dart';

class EditPasswordState implements Cloneable<EditPasswordState> {
  TextEditingController oldPwdController = TextEditingController();
  TextEditingController newPwdController = TextEditingController();
  bool isSetPwd = false;

  @override
  EditPasswordState clone() {
    return EditPasswordState()
      ..oldPwdController = oldPwdController
      ..newPwdController = newPwdController
      ..isSetPwd = isSetPwd;
  }
}

EditPasswordState initState(Map<String, dynamic> args) {
  EditPasswordState state = EditPasswordState();

  return state;
}
