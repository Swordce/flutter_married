import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FindResultState> buildReducer() {
  return asReducer(
    <Object, Reducer<FindResultState>>{
      FindResultAction.action: _onAction,
    },
  );
}

FindResultState _onAction(FindResultState state, Action action) {
  final FindResultState newState = state.clone();
  return newState;
}
