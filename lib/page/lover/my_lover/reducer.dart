import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MyLoverState> buildReducer() {
  return asReducer(
    <Object, Reducer<MyLoverState>>{
      MyLoverAction.action: _onAction,
    },
  );
}

MyLoverState _onAction(MyLoverState state, Action action) {
  final MyLoverState newState = state.clone();
  return newState;
}
