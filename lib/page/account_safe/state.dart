import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_married/bean/user_info.dart';

class AccountSafeState implements Cloneable<AccountSafeState> {
  BasicInfo basicInfo;

  @override
  AccountSafeState clone() {
    return AccountSafeState()..basicInfo=basicInfo;
  }
}

AccountSafeState initState(Map<String, dynamic> args) {
  return AccountSafeState();
}
