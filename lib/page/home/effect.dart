import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/widgets.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState:_onInit,
    HomeAction.action: _onAction,
  });
}

void _onAction(Action action, Context<HomeState> ctx) {
}

void _onInit(Action action, Context<HomeState> ctx) async {
}


