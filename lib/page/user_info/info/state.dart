import 'package:fish_redux/fish_redux.dart';

import '../state.dart';

class InfoState implements Cloneable<InfoState> {

  @override
  InfoState clone() {
    return InfoState();
  }
}

class InfoConnector extends ConnOp<UserInfoState, InfoState> {
  @override
  InfoState get(UserInfoState state) {
    InfoState subState = InfoState();
    return subState;
  }
}
