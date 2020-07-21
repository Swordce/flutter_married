import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<DiscussionState> buildReducer() {
  return asReducer(
    <Object, Reducer<DiscussionState>>{
      DiscussionAction.action: _onAction,
    },
  );
}

DiscussionState _onAction(DiscussionState state, Action action) {
  final DiscussionState newState = state.clone();
  return newState;
}
