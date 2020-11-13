import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum UserAction { action,refreshUser,refreshPage }

class UserActionCreator {
  static Action onAction() {
    return const Action(UserAction.action);
  }

  static Action onRefreshUser() {
    return const Action(UserAction.refreshUser);
  }

  static Action onRefreshPage() {
    return const Action(UserAction.refreshPage);
  }
}
