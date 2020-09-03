import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_married/page/user_info/state.dart';

class PersonalDynamicState implements Cloneable<PersonalDynamicState> {

  @override
  PersonalDynamicState clone() {
    return PersonalDynamicState();
  }
}

class PersonalDynamicConnector extends ConnOp<UserInfoState, PersonalDynamicState> {
  @override
  PersonalDynamicState get(UserInfoState state) {
    PersonalDynamicState subState = PersonalDynamicState();
    return subState;
  }
}

