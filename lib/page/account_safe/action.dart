import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AccountSafeAction { action,refreshPage,getUserInfo }

class AccountSafeActionCreator {
  static Action onAction() {
    return const Action(AccountSafeAction.action);
  }

  static Action onRefreshPage() {
    return const Action(AccountSafeAction.refreshPage);
  }

  static Action onGetUserInfo() {
    return const Action(AccountSafeAction.getUserInfo);
  }
}
