import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_married/bean/user_info.dart';

class UserState implements Cloneable<UserState> {
  BasicInfo basicInfo;

  @override
  UserState clone() {
    return UserState()..basicInfo = basicInfo;
  }
}

UserState initState(Map<String, dynamic> args) {
  return UserState();
}
