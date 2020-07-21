import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FindState> buildReducer() {
  return asReducer(
    <Object, Reducer<FindState>>{
      FindAction.action: _onAction,
    },
  );
}

FindState _onAction(FindState state, Action action) {
  final FindState newState = state.clone();
  return newState;
}
