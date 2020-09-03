import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ViewLoverState> buildEffect() {
  return combineEffects(<Object, Effect<ViewLoverState>>{
    ViewLoverAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ViewLoverState> ctx) {
}
