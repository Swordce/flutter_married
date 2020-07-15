import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SplashAction { action,refreshPage,isVistor }

class SplashActionCreator {
  static Action onAction() {
    return const Action(SplashAction.action);
  }

  static Action onRefreshPage() {
    return const Action(SplashAction.refreshPage);
  }

  static Action onIsVistor(bool isVistor) {
    return Action(SplashAction.isVistor,payload: isVistor);
  }
}
