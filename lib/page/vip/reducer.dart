import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<OpenVipState> buildReducer() {
  return asReducer(
    <Object, Reducer<OpenVipState>>{
      OpenVipAction.refreshPage: _onRefreshPage,
    },
  );
}

OpenVipState _onRefreshPage(OpenVipState state, Action action) {
  final OpenVipState newState = state.clone();
  return newState;
}
