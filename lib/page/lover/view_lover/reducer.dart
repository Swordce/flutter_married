import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ViewLoverState> buildReducer() {
  return asReducer(
    <Object, Reducer<ViewLoverState>>{
      ViewLoverAction.action: _onAction,
    },
  );
}

ViewLoverState _onAction(ViewLoverState state, Action action) {
  final ViewLoverState newState = state.clone();
  return newState;
}
