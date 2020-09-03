import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<LoverState> buildReducer() {
  return asReducer(
    <Object, Reducer<LoverState>>{
      LoverAction.action: _onAction,
    },
  );
}

LoverState _onAction(LoverState state, Action action) {
  final LoverState newState = state.clone();
  return newState;
}
