import 'package:fish_redux/fish_redux.dart';

class UserInfoState implements Cloneable<UserInfoState> {

  bool isEdit = false;
  bool isShowInfo = false;

  @override
  UserInfoState clone() {
    return UserInfoState()..isEdit = isEdit..isShowInfo = isShowInfo;
  }
}

UserInfoState initState(Map<String, dynamic> args) {
  UserInfoState newState = UserInfoState();
  newState.isEdit = args['isEdit']??false;
  return newState;
}
