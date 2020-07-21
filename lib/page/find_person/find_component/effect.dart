import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<FindState> buildEffect() {
  return combineEffects(<Object, Effect<FindState>>{
    FindAction.action: _onAction,
  });
}

void _onAction(Action action, Context<FindState> ctx) {
}
