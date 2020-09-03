import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<OpenVipState> buildEffect() {
  return combineEffects(<Object, Effect<OpenVipState>>{
    OpenVipAction.action: _onAction,
    OpenVipAction.changeIndex: _onChangeIndex,
  });
}

void _onAction(Action action, Context<OpenVipState> ctx) {}

void _onChangeIndex(Action action, Context<OpenVipState> ctx) {
  ctx.state.selectIndex = action.payload;
  println(action.payload);
  ctx.dispatch(OpenVipActionCreator.onRefreshPage());
}
