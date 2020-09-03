import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<UserInfoState> buildReducer() {
  return asReducer(
    <Object, Reducer<UserInfoState>>{
      UserInfoAction.action: _onAction,
      UserInfoAction.filterChanged: _onFilterChanged,
    },
  );
}

UserInfoState _onAction(UserInfoState state, Action action) {
  final UserInfoState newState = state.clone();
  return newState;
}

UserInfoState _onFilterChanged(UserInfoState state, Action action) {
  final UserInfoState newState = state.clone();
  newState.isShowInfo = action.payload;
  return newState;
}
