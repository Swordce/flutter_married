import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<EditPhoneState> buildReducer() {
  return asReducer(
    <Object, Reducer<EditPhoneState>>{
      EditPhoneAction.action: _onAction,
      EditPhoneAction.refreshPage: _onRefreshPage,
    },
  );
}

EditPhoneState _onAction(EditPhoneState state, Action action) {
  final EditPhoneState newState = state.clone();
  return newState;
}

EditPhoneState _onRefreshPage(EditPhoneState state, Action action) {
  final EditPhoneState newState = state.clone();
  return newState;
}
