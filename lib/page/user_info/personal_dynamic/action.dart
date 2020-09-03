import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PersonalDynamicAction { action }

class PersonalDynamicActionCreator {
  static Action onAction() {
    return const Action(PersonalDynamicAction.action);
  }
}
