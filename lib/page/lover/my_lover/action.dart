import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MyLoverAction { action }

class MyLoverActionCreator {
  static Action onAction() {
    return const Action(MyLoverAction.action);
  }
}
