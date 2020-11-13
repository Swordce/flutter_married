import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class EditPasswordState implements Cloneable<EditPasswordState> {

  TextEditingController oldPwdController = TextEditingController();
  TextEditingController newPwdController = TextEditingController();

  @override
  EditPasswordState clone() {
    return EditPasswordState()..oldPwdController=oldPwdController..newPwdController=newPwdController;
  }
}

EditPasswordState initState(Map<String, dynamic> args) {
  return EditPasswordState();
}
