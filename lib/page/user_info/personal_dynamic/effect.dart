import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<PersonalDynamicState> buildEffect() {
  return combineEffects(<Object, Effect<PersonalDynamicState>>{
    PersonalDynamicAction.action: _onAction,
  });
}

void _onAction(Action action, Context<PersonalDynamicState> ctx) {
}
