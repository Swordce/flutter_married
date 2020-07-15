import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<LoginState> buildReducer() {
  return asReducer(
    <Object, Reducer<LoginState>>{
      LoginAction.refreshPage: _onRefreshPage,
    },
  );
}

LoginState _onRefreshPage(LoginState state, Action action) {
  final LoginState newState = state.clone();
  return newState;
}
