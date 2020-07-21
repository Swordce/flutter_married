import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_married/page/find_person/data/condition.dart';

import '../state.dart';

class FindState implements Cloneable<FindState> {
  bool findExtend;
  bool isUnlock;
  bool updateFind;
  List<FindCondition> findConditions;

  @override
  FindState clone() {
    return FindState()
      ..findExtend = findExtend
      ..isUnlock = isUnlock
      ..updateFind = updateFind
      ..findConditions = findConditions;
  }
}

class FindConnector extends ConnOp<FindPersonState, FindState> {
  @override
  FindState get(FindPersonState state) {
    FindState subState = FindState();
    subState.findExtend = state.findExtend;
    subState.findConditions = state.findConditions;
    subState.isUnlock = state.findUnlock;
    subState.updateFind = state.updateFind;
    return subState;
  }
}
