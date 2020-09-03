import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<DiscussionDetailState> buildEffect() {
  return combineEffects(<Object, Effect<DiscussionDetailState>>{
    DiscussionDetailAction.action: _onAction,
  });
}

void _onAction(Action action, Context<DiscussionDetailState> ctx) {
}
