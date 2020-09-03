import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'data/condition.dart';
import 'state.dart';

Reducer<FindPersonState> buildReducer() {
  return asReducer(
    <Object, Reducer<FindPersonState>>{
      FindPersonAction.action: _onAction,
      FindPersonAction.filterChanged: _onFilterChanged,
      FindPersonAction.updateExtended: _onUpdateExtend,
      FindPersonAction.refreshPage: _onRefresh,
      FindPersonAction.updateTextValue: _onUpdateValue,
    },
  );
}

FindPersonState _onAction(FindPersonState state, Action action) {
  final FindPersonState newState = state.clone();
  return newState;
}

FindPersonState _onUpdateValue(FindPersonState state, Action action) {
  final FindPersonState newState = state.clone();
  if(state.showPersonal) {
    FindCondition condition = state.personalConditions[action.payload['index']];
    condition.value = action.payload['value'];
    newState.personalConditions[action.payload['index']] = condition;
    if(state.updatePersonal) {
      newState.updatePersonal = false;
    }else {
      newState.updatePersonal = true;
    }
  }else {
    FindCondition condition = state.findConditions[action.payload['index']];
    condition.value = action.payload['value'];
    newState.findConditions[action.payload['index']] = condition;
    if(state.updateFind) {
      newState.updateFind = false;
    }else {
      newState.updateFind = true;
    }
  }
  return newState;
}

FindPersonState _onRefresh(FindPersonState state, Action action) {
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