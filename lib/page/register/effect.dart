import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter_married/net/api.dart';
import 'package:flutter_married/utils/http/http_error.dart';
import 'package:flutter_married/utils/http/http_manager.dart';
import 'package:flutter_married/utils/regex_utils.dart';
import 'package:flutter_married/utils/sp_util.dart';
import 'package:flutter_married/widgets/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'action.dart';
import 'state.dart';

Effect<RegisterState> buildEffect() {
  return combineEffects(<Object, Effect<RegisterState>>{
    RegisterAction.action: _onAction,
    RegisterAction.isShowPwd: _onIsShowPwd,
    RegisterAction.isVerityCodeLogin: _onIsVerityCodeLogin,
    RegisterAction.getVerityCode: _onGetVerityCode,
    RegisterAction.isMale: _onIsMale,
    RegisterAction.changeCountryCode: _onChangeCountryCode,
    RegisterAction.register: _onRegister,
    Lifecycle.initState: _onInit,
    Lifecycle.dispose: _onDispose,
  });
}

void _onInit(Action action, Context<RegisterState> ctx) {
  ctx.state.phoneEditController = TextEditingController();
  ctx.state.pwdEditController = TextEditingController();
}

void _onChangeCountryCode(Action action, Context<RegisterState> ctx) {
  ctx.state.code = action.payload;
  ctx.dispatch(RegisterActionCreator.onRefreshPage());
  FocusScope.of(ctx.context).requestFocus(FocusNode());
}

void _onDispose(Action action, Context<RegisterState> ctx) {
  ctx.state.phoneEditController.dispose();
  ctx.state.pwdEditController.dispose();
  if (ctx.state.timer != null) {
    ctx.state.timer.cancel();
    ctx.state.timer = null;
  }
}

void _onAction(Action action, Context<RegisterState> ctx) {}

void _onRegister(Action action, Context<RegisterState> ctx) {
  String code = ctx.state.pwdEditController.text;
  String phone = ctx.state.phoneEditController.text;
  String sex = ctx.state.isMale ? "男" : "女";

  // DioManager().get(url: Api.registerUrl,params: {'code':code,'phone':phone,'sex':sex});

  HttpManager().post(
      url: Api.registerUrl,
      data: {'code': code, 'phone': phone, 'sex': sex},
      successCallback: (data) {
        SpUtil().putString('userId', data['userId']);
        SpUtil().putString('token', data['token']);
        Navigator.of(ctx.context).pushNamed('improve_info_page');
      },
      errorCallback: (HttpError error) {
        Toast.toast(ctx.context,msg: error.message);
      },
      tag: 'register');

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
  String phoneNum = ctx.state.phoneEditController.text;
  if (RegUtils.regPhone(phoneNum)) {
    HttpManager().get(
        url: Api.smsCodeUrl,
        params: {'phone': phoneNum,},
        successCallback: (data) {
          _countDownTimer(ctx);
        },
        errorCallback: (HttpError error){
          Toast.toast(ctx.context,msg: error.message);
        },
        tag: 'smsCode');
    return;
  }
  Toast.toast(ctx.context,
      position: 'center', msg: phoneNum.isEmpty ? '请输入手机号' : '手机号格式不正确');
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
