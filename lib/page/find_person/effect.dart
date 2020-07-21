import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<FindPersonState> buildEffect() {
  return combineEffects(<Object, Effect<FindPersonState>>{
    FindPersonAction.action: _onAction,
  });
}

void _onAction(Action action, Context<FindPersonState> ctx) {
}
