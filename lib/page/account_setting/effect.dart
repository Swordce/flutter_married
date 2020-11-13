import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<AccountSettingState> buildEffect() {
  return combineEffects(<Object, Effect<AccountSettingState>>{
    AccountSettingAction.action: _onAction,
  });
}

void _onAction(Action action, Context<AccountSettingState> ctx) {
}
