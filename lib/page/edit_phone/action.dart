import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum EditPhoneAction { action,editPhone,refreshPage,getSmsCode,save }

class EditPhoneActionCreator {
  static Action onAction() {
    return const Action(EditPhoneAction.action);
  }

  static Action onSave() {
    return const Action(EditPhoneAction.save);
  }

  static Action onGetSmsCode() {
    return const Action(EditPhoneAction.getSmsCode);
  }


  static Action onEditPhone() {
    return const Action(EditPhoneAction.action);
  }
  static Action onRefreshPage() {
    return const Action(EditPhoneAction.refreshPage);
  }

}
