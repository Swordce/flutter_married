import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<SplashState> buildEffect() {
  return combineEffects(<Object, Effect<SplashState>>{
    SplashAction.action: _onAction,
    SplashAction.isVistor: _onIsVistor,
  });
}

void _onAction(Action action, Context<SplashState> ctx) {
}

void _onIsVistor(Action action, Context<SplashState> ctx) {
  ctx.state.isVistor = action.payload;
  ctx.dispatch(SplashActionCreator.onRefreshPage());
}
