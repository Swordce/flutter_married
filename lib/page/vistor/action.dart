import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum VistorAction { action }

class VistorActionCreator {
  static Action onAction() {
    return const Action(VistorAction.action);
  }
}
