import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_married/bean/country_code.dart';

class CountryCodeState implements Cloneable<CountryCodeState> {

  String defaultCode = '+86';
  List<CountryCode> codes = [];


  @override
  CountryCodeState clone() {
    return CountryCodeState()..codes = codes..defaultCode = defaultCode;
  }
}

CountryCodeState initState(Map<String, dynamic> args) {
  CountryCodeState newState = CountryCodeState();
  newState.defaultCode = args['code'];
  return newState;
}
