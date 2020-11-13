import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SignAction { action,refresh,sign }

class SignActionCreator {
  static Action onAction() {
    return const Action(SignAction.action);
  }

  static Action onSign() {
    return const Action(SignAction.sign);
  }

  static Action onRefreshPage() {
    return const Action(SignAction.refresh);
  }
}
