import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_married/bean/country_code.dart';

//TODO replace with your own action
enum LoginAction { action,refreshPage,isShowPwd,isVistor,isVerityCodeLogin,getVerityCode,changeCountryCode,login }

class LoginActionCreator {
  static Action onAction() {
    return const Action(LoginAction.action);
  }

  static Action onLogin() {
    return const Action(LoginAction.login);
  }

  static Action onChangeCountryCode(CountryCode code) {
    return Action(LoginAction.changeCountryCode,payload: code);
  }

  static Action onGetVerityCode() {
    return const Action(LoginAction.getVerityCode);
  }

  static Action onIsVistor() {
    return const Action(LoginAction.isVistor);
  }

  static Action onIsShowPwd() {
    return const Action(LoginAction.isShowPwd);
  }

  static Action onIsVerityCodeLogin() {
    return Action(LoginAction.isVerityCodeLogin);
  }

  static Action onRefreshPage() {
    return const Action(LoginAction.refreshPage);
  }
}
