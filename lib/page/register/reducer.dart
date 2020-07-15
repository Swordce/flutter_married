import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RegisterState> buildReducer() {
  return asReducer(
    <Object, Reducer<RegisterState>>{
      RegisterAction.refreshPage: _onRefreshPage,
    },
  );
}

RegisterState _onRefreshPage(RegisterState state, Action action) {
  final RegisterState newState = state.clone();
  return newState;
}
