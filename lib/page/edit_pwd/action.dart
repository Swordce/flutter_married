import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum EditPasswordAction { action,savePwd }

class EditPasswordActionCreator {
  static Action onAction() {
    return const Action(EditPasswordAction.action);
  }

  static Action onSavePwd() {
    return const Action(EditPasswordAction.savePwd);
  }
}
