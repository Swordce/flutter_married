import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<VistorState> buildEffect() {
  return combineEffects(<Object, Effect<VistorState>>{
    VistorAction.action: _onAction,
  });
}

void _onAction(Action action, Context<VistorState> ctx) {
}
