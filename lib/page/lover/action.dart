import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum LoverAction { action,filterChanged }

class LoverActionCreator {
  static Action onAction() {
    return const Action(LoverAction.action);
  }

  static Action onFilterChanged(bool b) {
    return  Action(LoverAction.filterChanged,payload: b);
  }
}
