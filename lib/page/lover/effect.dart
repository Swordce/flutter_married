import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<LoverState> buildEffect() {
  return combineEffects(<Object, Effect<LoverState>>{
    LoverAction.action: _onAction,
  });
}

void _onAction(Action action, Context<LoverState> ctx) {
}
