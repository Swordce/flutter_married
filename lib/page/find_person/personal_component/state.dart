import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_married/page/find_person/data/condition.dart';
import 'package:flutter_married/page/find_person/state.dart';
import 'package:flutter_married/widgets/datetime_picker/date_format.dart';

class PersonalState implements Cloneable<PersonalState> {
  bool personalExtend;
  bool updatePersonal;
  List<FindCondition> personalConditions;

  @override
  PersonalState clone() {
    return PersonalState()..personalExtend = personalExtend..personalConditions = personalConditions..updatePersonal=updatePersonal;
  }
}

class PersonalConnector extends ConnOp<FindPersonState,PersonalState> {

  @override
  PersonalState get(FindPersonState state) {
    PersonalState subState = PersonalState();
    subState.personalExtend = state.personalExtend;
    subState.personalConditions = state.personalConditions;
    subState.updatePersonal = state.updatePersonal;
    return subState;
  }
}
