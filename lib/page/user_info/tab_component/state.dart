import 'package:fish_redux/fish_redux.dart';

import '../state.dart';

class TabState implements Cloneable<TabState> {

  bool showInfo;

  @override
  TabState clone() {
    return TabState()..showInfo = showInfo;
  }
}

class TabConnector extends ConnOp<UserInfoState, TabState> {
  @override
  TabState get(UserInfoState state) {
    TabState substate = new TabState();
    substate.showInfo = state.isShowInfo;
    return substate;
  }
}
