import 'package:fish_redux/fish_redux.dart';

class AccountSettingState implements Cloneable<AccountSettingState> {

  @override
  AccountSettingState clone() {
    return AccountSettingState();
  }
}

AccountSettingState initState(Map<String, dynamic> args) {
  return AccountSettingState();
}
