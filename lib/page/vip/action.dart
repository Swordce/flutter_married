import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum OpenVipAction { action,changeIndex,refreshPage,payOrder }

class OpenVipActionCreator {
  static Action onAction() {
    return const Action(OpenVipAction.action);
  }

  static Action onPay() {
    return const Action(OpenVipAction.payOrder);
  }

  static Action onChangeIndex(int index) {
    return Action(OpenVipAction.changeIndex,payload: index);
  }

  static Action onRefreshPage() {
    return const Action(OpenVipAction.refreshPage);
  }
}
