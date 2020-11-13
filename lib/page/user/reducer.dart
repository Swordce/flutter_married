import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<UserState> buildReducer() {
  return asReducer(
    <Object, Reducer<UserState>>{
      UserAction.action: _onAction,
      UserAction.action: _onRefreshPage,
    },
  );
}

UserState _onAction(UserState state, Action action) {
  final UserState newState = state.clone();
  return newState;
}

UserState _onRefreshPage(UserState state, Action action) {
  final UserState newState = state.clone();
  return newState;
}
