import 'package:fish_redux/fish_redux.dart';

import '../state.dart';

class ViewLoverState implements Cloneable<ViewLoverState> {

  @override
  ViewLoverState clone() {
    return ViewLoverState();
  }
}

class ViewLoverConnector extends ConnOp<LoverState, ViewLoverState> {
  @override
  ViewLoverState get(LoverState state) {
    ViewLoverState subState = ViewLoverState();
    return subState;
  }
}
