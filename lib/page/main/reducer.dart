import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MainState> buildReducer() {
  return asReducer(
    <Object, Reducer<MainState>>{
      MainAction.action: _onAction,
      MainAction.change: _onChange,
    },
  );
}

MainState _onAction(MainState state, Action action) {
  final MainState newState = state.clone();
  return newState;
}

MainState _onChange(MainState state, Action action) {
  final MainState newState = state.clone();
  newState.selectedIndex = action.payload??0;
  return newState;
}
