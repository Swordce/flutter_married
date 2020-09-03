import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<FindResultState> buildEffect() {
  return combineEffects(<Object, Effect<FindResultState>>{
    FindResultAction.action: _onAction,
  });
}

void _onAction(Action action, Context<FindResultState> ctx) {
}
