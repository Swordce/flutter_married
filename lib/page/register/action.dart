import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_married/bean/country_code.dart';

//TODO replace with your own action
enum RegisterAction { action,refreshPage,isShowPwd,isVerityCodeLogin,getVerityCode,isMale,changeCountryCode,register }

class RegisterActionCreator {
  static Action onAction() {
    return const Action(RegisterAction.action);
  }

  static Action onRegister() {
    return const Action(RegisterAction.register);
  }

  static Action onChangeCountryCode(CountryCode code) {
    return  Action(RegisterAction.changeCountryCode,payload: code);
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
