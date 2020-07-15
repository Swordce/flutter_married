import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ImproveInformationState> buildReducer() {
  return asReducer(
    <Object, Reducer<ImproveInformationState>>{
      ImproveInformationAction.refreshPage: _onRefresh,
    },
  );
}

ImproveInformationState _onRefresh(ImproveInformationState state, Action action) {
  final ImproveInformationState newState = state.clone();
  return newState;
}
