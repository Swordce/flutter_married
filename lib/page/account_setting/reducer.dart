import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AccountSettingState> buildReducer() {
  return asReducer(
    <Object, Reducer<AccountSettingState>>{
      AccountSettingAction.action: _onAction,
    },
  );
}

AccountSettingState _onAction(AccountSettingState state, Action action) {
  final AccountSettingState newState = state.clone();
  return newState;
}
