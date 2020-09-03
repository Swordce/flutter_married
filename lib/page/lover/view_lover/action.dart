import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ViewLoverAction { action }

class ViewLoverActionCreator {
  static Action onAction() {
    return const Action(ViewLoverAction.action);
  }
}
