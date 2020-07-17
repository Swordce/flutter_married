import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<VistorState> buildReducer() {
  return asReducer(
    <Object, Reducer<VistorState>>{
      VistorAction.action: _onAction,
    },
  );
}

VistorState _onAction(VistorState state, Action action) {
  final VistorState newState = state.clone();
  return newState;
}
