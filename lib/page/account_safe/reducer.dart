import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AccountSafeState> buildReducer() {
  return asReducer(
    <Object, Reducer<AccountSafeState>>{
      AccountSafeAction.action: _onAction,
      AccountSafeAction.refreshPage: _onRefreshPage,
    },
  );
}

AccountSafeState _onAction(AccountSafeState state, Action action) {
  final AccountSafeState newState = state.clone();
  return newState;
}

AccountSafeState _onRefreshPage(AccountSafeState state, Action action) {
  final AccountSafeState newState = state.clone();
  return newState;
}
