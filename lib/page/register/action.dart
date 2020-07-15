import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RegisterAction { action,refreshPage,isShowPwd,isVerityCodeLogin,getVerityCode,isMale }

class RegisterActionCreator {
  static Action onAction() {
    return const Action(RegisterAction.action);
  }

  static Action onIsMale(bool isMale) {
    return  Action(RegisterAction.isMale,payload: isMale);
  }

  static Action onGetVerityCode() {
    return const Action(RegisterAction.getVerityCode);
  }

  static Action onIsShowPwd() {
    return const Action(RegisterAction.isShowPwd);
  }

  static Action onIsVerityCodeLogin() {
    return Action(RegisterAction.isVerityCodeLogin);
  }

  static Action onRefreshPage() {
    return const Action(RegisterAction.refreshPage);
  }
}
