import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_married/page/find_person/data/condition.dart';

class FindPersonState implements Cloneable<FindPersonState> {
  bool showPersonal;
  bool personalExtend;
  bool findExtend;
  bool updatePersonal = false;
  bool updateFind = false;
  bool findUnlock = true;

  List<String> personalConditionKeys = [
    '年龄',
    '籍贯',
    '居住地',
    '职业',
    '身高',
    '学历',
    '月收入',
    '婚姻状况',
    '购车情况',
    '是否想要孩子',
    '何时结婚',
  ];

  List<String> findConditionKeys = [
    '年龄',
    '籍贯',
    '居住地',
    '职业',
    '身高',
    '学历',
    '月收入',
    '婚姻状况',
    '购车情况',
    '是否想要孩子',
    '是否抽烟',
    '是否喝酒',
    '何时结婚',
  ];
  List<FindCondition> personalConditions = [];
  List<FindCondition> findConditions = [];

  @override
  FindPersonState clone() {
    return FindPersonState()
      ..showPersonal = showPersonal
      ..personalExtend = personalExtend
      ..findExtend = findExtend
      ..personalConditions = personalConditions
      ..personalConditionKeys = personalConditionKeys
      ..findConditionKeys = findConditionKeys
      ..findConditions = findConditions;
  }
}

FindPersonState initState(Map<String, dynamic> args) {
  FindPersonState state = FindPersonState();
  state.showPersonal = true;
  state.personalExtend = false;
  state.findExtend = false;
  state.personalConditionKeys.forEach((key) {
    FindCondition condition = FindCondition();
    condition.key = key;
    condition.value = '';
    state.personalConditions.add(condition);
  });
  state.findConditionKeys.forEach((key) {
    FindCondition condition = FindCondition();
    condition.key = key;
    condition.value = '';
    state.findConditions.add(condition);
  });
  return state;
}
