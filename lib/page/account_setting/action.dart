import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AccountSettingAction { action }

class AccountSettingActionCreator {
  static Action onAction() {
    return const Action(AccountSettingAction.action);
  }
}
