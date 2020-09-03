import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum UserInfoAction { action,filterChanged }

class UserInfoActionCreator {
  static Action onAction() {
    return const Action(UserInfoAction.action);
  }

  static Action onFilterChanged(bool b) {
    return  Action(UserInfoAction.filterChanged,payload: b);
  }
}
