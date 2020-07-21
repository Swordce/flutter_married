import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum FindPersonAction { action,filterChanged,updateExtended }

class FindPersonActionCreator {
  static Action onAction() {
    return const Action(FindPersonAction.action);
  }

  static Action onUpdateExtended(bool b) {
    return  Action(FindPersonAction.updateExtended,payload: b);
  }

  static Action onFilterChanged(bool b) {
    return  Action(FindPersonAction.filterChanged,payload: b);
  }
}
