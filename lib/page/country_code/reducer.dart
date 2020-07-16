import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CountryCodeState> buildReducer() {
  return asReducer(
    <Object, Reducer<CountryCodeState>>{
      CountryCodeAction.refreshPage: _onRefresh,
    },
  );
}

CountryCodeState _onRefresh(CountryCodeState state, Action action) {
  final CountryCodeState newState = state.clone();
  return newState;
}
