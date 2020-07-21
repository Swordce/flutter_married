import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter_married/page/discussion/page.dart';
import 'package:flutter_married/page/find_person/page.dart';
import 'package:flutter_married/page/home/page.dart';
import 'package:flutter_married/page/user/page.dart';

import 'action.dart';
import 'state.dart';

Effect<MainState> buildEffect() {
  return combineEffects(<Object, Effect<MainState>>{
    Lifecycle.initState: _onInit,
    MainAction.action: _onAction,
  });
}

void _onAction(Action action, Context<MainState> ctx) {}

void _onInit(Action action, Context<MainState> ctx) {
  ctx.state.pages = List<Widget>.unmodifiable([
    HomePage().buildPage(null),
    FindPersonPage().buildPage(null),
    DiscussionPage().buildPage(null),
    UserPage().buildPage(null),
  ]);
}
