import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<DiscussionState> buildEffect() {
  return combineEffects(<Object, Effect<DiscussionState>>{
    DiscussionAction.action: _onAction,
  });
}

void _onAction(Action action, Context<DiscussionState> ctx) {
}
