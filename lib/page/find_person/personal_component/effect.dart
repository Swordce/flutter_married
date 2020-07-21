import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<PersonalState> buildEffect() {
  return combineEffects(<Object, Effect<PersonalState>>{
    PersonalAction.action: _onAction,
  });
}

void _onAction(Action action, Context<PersonalState> ctx) {
}
