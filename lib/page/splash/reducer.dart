import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SplashState> buildReducer() {
  return asReducer(
    <Object, Reducer<SplashState>>{
      SplashAction.refreshPage: _onRefreshPage,
    },
  );
}

SplashState _onRefreshPage(SplashState state, Action action) {
  final SplashState newState = state.clone();
  return newState;
}
