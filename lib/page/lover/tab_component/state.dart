import 'package:fish_redux/fish_redux.dart';

import '../state.dart';

class TabState implements Cloneable<TabState> {

  bool showMyLover;

  @override
  TabState clone() {
    return TabState()..showMyLover = showMyLover;
  }
}

class TabConnector extends ConnOp<LoverState, TabState> {
  @override
  TabState get(LoverState state) {
    TabState substate = new TabState();
    substate.showMyLover = state.showMyLover;
    return substate;
  }
}
