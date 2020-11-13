import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<EditPasswordState> buildReducer() {
  return asReducer(
    <Object, Reducer<EditPasswordState>>{
      EditPasswordAction.action: _onAction,
    },
  );
}

EditPasswordState _onAction(EditPasswordState state, Action action) {
  final EditPasswordState newState = state.clone();
  return newState;
}
