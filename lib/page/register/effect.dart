import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<RegisterState> buildEffect() {
  return combineEffects(<Object, Effect<RegisterState>>{
    RegisterAction.action: _onAction,
    RegisterAction.isShowPwd: _onIsShowPwd,
    RegisterAction.isVerityCodeLogin: _onIsVerityCodeLogin,
    RegisterAction.getVerityCode: _onGetVerityCode,
    RegisterAction.isMale: _onIsMale,
    Lifecycle.initState: _onInit,
    Lifecycle.dispose:_onDispose,
  });
}



void _onInit(Action action, Context<RegisterState> ctx) {
  ctx.state.phoneEditController = TextEditingController();
  ctx.state.pwdEditController = TextEditingController();
}

void _onDispose(Action action, Context<RegisterState> ctx) {
  ctx.state.phoneEditController.dispose();
  ctx.state.pwdEditController.dispose();
  if(ctx.state.timer != null) {
    ctx.state.timer.cancel();
    ctx.state.timer = null;
  }
}

void _onAction(Action action, Context<RegisterState> ctx) {
}

void _onIsMale(Action action, Context<RegisterState> ctx) {
  ctx.state.isMale = action.payload;
  ctx.dispatch(RegisterActionCreator.onRefreshPage());
}

void _countDownTimer(Context<RegisterState> ctx) {
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
    ctx.dispatch(RegisterActionCreator.onRefreshPage());
  });
}

void _onGetVerityCode(Action action, Context<RegisterState> ctx) {
  _countDownTimer(ctx);
}

void _onIsShowPwd(Action action, Context<RegisterState> ctx) {
  if (ctx.state.isShowPwd) {
    ctx.state.isShowPwd = false;
  } else {
    ctx.state.isShowPwd = true;
  }
  ctx.dispatch(RegisterActionCreator.onRefreshPage());
}

void _onIsVerityCodeLogin(Action action, Context<RegisterState> ctx) {
  if (ctx.state.isVerityCodeLogin ?? false) {
    ctx.state.isVerityCodeLogin = false;
  } else {
    ctx.state.isVerityCodeLogin = true;
  }
//  ctx.state.countDownTime = 60;
//  if(ctx.state.timer != null) {
//    ctx.state.timer.cancel();
//  }
  ctx.dispatch(RegisterActionCreator.onRefreshPage());
}
