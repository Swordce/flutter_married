import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum FindPersonAction { action,filterChanged,updateExtended,updateTextValue,refreshPage }

class FindPersonActionCreator {
  static Action onAction() {
    return const Action(FindPersonAction.action);
  }

  static Action onUpdateValue(int index,String value) {
    return Action(FindPersonAction.updateTextValue,payload: {'index':index,'value':value});
  }

  static Action onRefreshPage() {
    return const Action(FindPersonAction.refreshPage);
  }

  static Action onUpdateExtended(bool b) {
    return Action(FindPersonAction.updateExtended,payload: b);
  }

  static Action onFilterChanged(bool b) {
    return  Action(FindPersonAction.filterChanged,payload: b);
  }
}
