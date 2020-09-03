import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<MyLoverState> buildEffect() {
  return combineEffects(<Object, Effect<MyLoverState>>{
    MyLoverAction.action: _onAction,
  });
}

void _onAction(Action action, Context<MyLoverState> ctx) {
}
