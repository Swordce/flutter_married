import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PersonalDynamicState> buildReducer() {
  return asReducer(
    <Object, Reducer<PersonalDynamicState>>{
      PersonalDynamicAction.action: _onAction,
    },
  );
}

PersonalDynamicState _onAction(PersonalDynamicState state, Action action) {
  final PersonalDynamicState newState = state.clone();
  return newState;
}
