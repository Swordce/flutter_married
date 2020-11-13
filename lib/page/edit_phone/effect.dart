import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_married/net/api.dart';
import 'package:flutter_married/utils/http/http_error.dart';
import 'package:flutter_married/utils/http/http_manager.dart';
import 'package:flutter_married/utils/regex_utils.dart';
import 'package:flutter_married/widgets/toast.dart';

import 'action.dart';
import 'state.dart';

Effect<EditPhoneState> buildEffect() {
  return combineEffects(<Object, Effect<EditPhoneState>>{
    EditPhoneAction.action: _onAction,
    EditPhoneAction.save: _onSave,
    EditPhoneAction.getSmsCode: _onGetVerityCode,

  });
}

void _onAction(Action action, Context<EditPhoneState> ctx) {
}

void _onSave(Action action, Context<EditPhoneState> ctx) {
  String phone = ctx.state.phoneController.text.toString();
  String smsCode = ctx.state.smsCodeController.text.toString();
  HttpManager().post(
      url: Api.editUserPhone,
      data: {'phone': phone,'code':smsCode},
      successCallback: (data) {
        Toast.toast(ctx.context,msg: '保存成功');
      },
      errorCallback: (HttpError error) {
        Toast.toast(ctx.context,msg: error.message);
      },
      tag: 'smsCode');
}


void _onGetVerityCode(Action action, Context<EditPhoneState> ctx) {
  String phoneNum = ctx.state.phoneController.text;
  if (RegUtils.regPhone(phoneNum)) {
    HttpManager().get(
        url: Api.smsCodeUrl,
        params: {'phone': phoneNum,},
        successCallback: (data) {
          _countDownTimer(ctx);
        },
        errorCallback: (data) {
          println('$data=================================');
        },
        tag: 'smsCode');
    return;
  }
  Toast.toast(ctx.context,
      position: 'center', msg: phoneNum.isEmpty ? '请输入手机号' : '手机号格式不正确');
}

void _countDownTimer(Context<EditPhoneState> ctx) {
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
    ctx.dispatch(EditPhoneActionCreator.onRefreshPage());
  });
}