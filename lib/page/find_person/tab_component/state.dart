import 'package:fish_redux/fish_redux.dart';

import '../state.dart';

class TabState implements Cloneable<TabState> {

  bool showPersonal;

  @override
  TabState clone() {
    return TabState()..showPersonal = showPersonal;
  }
}

class TabConnector extends ConnOp<FindPersonState, TabState> {
  @override
  TabState get(FindPersonState state) {
    TabState substate = new TabState();
    substate.showPersonal = state.showPersonal;
    return substate;
  }
}
