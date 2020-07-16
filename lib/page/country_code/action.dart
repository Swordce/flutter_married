import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CountryCodeAction { action,refreshPage }

class CountryCodeActionCreator {
  static Action onAction() {
    return const Action(CountryCodeAction.action);
  }

  static Action onRefreshPage() {
    return const Action(CountryCodeAction.refreshPage);
  }
}
