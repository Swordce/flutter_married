import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<DiscussionDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<DiscussionDetailState>>{
      DiscussionDetailAction.action: _onAction,
    },
  );
}

DiscussionDetailState _onAction(DiscussionDetailState state, Action action) {
  final DiscussionDetailState newState = state.clone();
  return newState;
}
