import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SignState> buildReducer() {
  return asReducer(
    <Object, Reducer<SignState>>{
      SignAction.refresh: _onRefresh,
    },
  );
}

SignState _onAction(SignState state, Action action) {
  final SignState newState = state.clone();
  return newState;
}

SignState _onRefresh(SignState state, Action action) {
  final SignState newState = state.clone();
  return newState;
}
