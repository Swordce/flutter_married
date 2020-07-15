import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.action: _onAction,
    LoginAction.isShowPwd: _onIsShowPwd,
    LoginAction.isVistor: _onIsVistor,
    LoginAction.isVerityCodeLogin: _onIsVerityCodeLogin,
    LoginAction.getVerityCode: _onGetVerityCode,
    Lifecycle.initState: _onInit,
    Lifecycle.dispose:_onDispose,
  });
}

void _onAction(Action action, Context<LoginState> ctx) {}

void _countDownTimer(Context<LoginState> ctx) {
  ctx.state.timer = Timer.periodic(Duration(seconds: 1), (timer) {
    if (ctx.state.countDownTime == -1) {
      ctx.state.countDownTime = 60;
    }
    if (ctx.state.countDownTime > 0 && ctx.state.countDownTime <= 60) {
      int time = ctx.state.countDownTime;
      ctx.state.countDownTime = time - 1;
    } else {
      ctx.state.countDownTime = -1;
      timer.cancel();
    }
    ctx.dispatch(LoginActionCreator.onRefreshPage());
  });
}

void _onGetVerityCode(Action action, Context<LoginState> ctx) {
  _countDownTimer(ctx);
}

void _onInit(Action action, Context<LoginState> ctx) {
  ctx.state.phoneEditController = TextEditingController();
  ctx.state.pwdEditController = TextEditingController();
}

void _onDispose(Action action, Context<LoginState> ctx) {
  ctx.state.phoneEditController.dispose();
  ctx.state.pwdEditController.dispose();
  if(ctx.state.timer != null) {
    ctx.state.timer.cancel();
    ctx.state.timer = null;
  }
}

void _onIsVistor(Action action, Context<LoginState> ctx) {
  if (ctx.state.isVistor) {
    ctx.state.isVistor = false;
  } else {
    ctx.state.isVistor = true;
  }
  ctx.dispatch(LoginActionCreator.onRefreshPage());
}

void _onIsShowPwd(Action action, Context<LoginState> ctx) {
  if (ctx.state.isShowPwd) {
    ctx.state.isShowPwd = false;
  } else {
    ctx.state.isShowPwd = true;
  }
  ctx.dispatch(LoginActionCreator.onRefreshPage());
}

void _onIsVerityCodeLogin(Action action, Context<LoginState> ctx) {
  if (ctx.state.isVerityCodeLogin ?? false) {
    ctx.state.isVerityCodeLogin = false;
  } else {
    ctx.state.isVerityCodeLogin = true;
  }
//  ctx.state.countDownTime = 60;
//  if(ctx.state.timer != null) {
//    ctx.state.timer.cancel();
//  }
  ctx.dispatch(LoginActionCreator.onRefreshPage());
}
