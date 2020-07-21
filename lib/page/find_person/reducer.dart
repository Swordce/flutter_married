import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FindPersonState> buildReducer() {
  return asReducer(
    <Object, Reducer<FindPersonState>>{
      FindPersonAction.action: _onAction,
      FindPersonAction.filterChanged: _onFilterChanged,
      FindPersonAction.updateExtended: _onUpdateExtend
    },
  );
}

FindPersonState _onAction(FindPersonState state, Action action) {
  final FindPersonState newState = state.clone();
  return newState;
}

FindPersonState _onUpdateExtend(FindPersonState state, Action action) {
  bool extended = action.payload??false;

  final FindPersonState newState = state.clone();
  if(state.showPersonal) {
    newState.personalExtend = extended;
  }else {
    newState.findExtend = extended;
  }
  return newState;
}


FindPersonState _onFilterChanged(FindPersonState state, Action action) {
  final FindPersonState newState = state.clone();
  newState.showPersonal = action.payload;
  return newState;
}