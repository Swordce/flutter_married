import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MainAction { action,change }

class MainActionCreator {
  static Action onAction() {
    return const Action(MainAction.action);
  }

  static Action onChange(int i) {
    return Action(MainAction.change,payload: i);
  }
}
