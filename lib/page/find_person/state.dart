import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_married/page/find_person/data/condition.dart';
import 'package:flutter_married/page/find_person/data/picker_data.dart';

class FindPersonState implements Cloneable<FindPersonState> {
  bool showPersonal;
  bool personalExtend;
  bool findExtend;
  bool updatePersonal = false;
  bool updateFind = false;
  bool findUnlock = true;
  List<FindCondition> personalConditions = [];
  List<FindCondition> findConditions = [];

  @override
  FindPersonState clone() {
    return FindPersonState()
      ..showPersonal = showPersonal
      ..personalExtend = personalExtend
      ..findExtend = findExtend
      ..personalConditions = personalConditions
      ..findConditions = findConditions;
  }
}

FindPersonState initState(Map<String, dynamic> args) {
  FindPersonState state = FindPersonState();
  state.showPersonal = true;
  state.personalExtend = false;
  state.findExtend = false;
  PickerData.personalConditionKeys.forEach((key) {
    FindCondition condition = FindCondition();
    condition.key = key;
    condition.value = '';
    state.personalConditions.add(condition);
  });
  PickerData.findConditionKeys.forEach((key) {
    FindCondition condition = FindCondition();
    condition.key = key;
    condition.value = '';
    state.findConditions.add(condition);
  });
  return state;
}
