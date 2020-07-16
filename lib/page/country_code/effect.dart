import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/services.dart';
import 'package:flutter_married/bean/country_code.dart';
import 'action.dart';
import 'state.dart';

Effect<CountryCodeState> buildEffect() {
  return combineEffects(<Object, Effect<CountryCodeState>>{
    CountryCodeAction.action: _onAction,
    Lifecycle.initState:_onInit,
  });
}

void _onAction(Action action, Context<CountryCodeState> ctx) {
}

void _onInit(Action action, Context<CountryCodeState> ctx) async {
 _loadCountryCode(ctx);
}

void _loadCountryCode(Context<CountryCodeState> ctx) {
  rootBundle.loadString('assets/files/countrycode.json').then((value) {
    List result = json.decode(value);
    ctx.state.codes = result.map((e) => CountryCode.fromJson(e)).toList();
    ctx.dispatch(CountryCodeActionCreator.onRefreshPage());
  });
}