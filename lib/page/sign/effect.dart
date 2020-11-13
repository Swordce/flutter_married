import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_married/bean/sign_task.dart';
import 'package:flutter_married/net/api.dart';
import 'package:flutter_married/utils/http/http_error.dart';
import 'package:flutter_married/utils/http/http_manager.dart';
import 'package:flutter_married/widgets/toast.dart';

import 'action.dart';
import 'state.dart';

Effect<SignState> buildEffect() {
  return combineEffects(<Object, Effect<SignState>>{
    SignAction.action: _onAction,
    SignAction.sign: _onSign,
    Lifecycle.initState: _init,
  });
}

void _onAction(Action action, Context<SignState> ctx) {}

void _onSign(Action action, Context<SignState> ctx) {
  HttpManager().get(
      url: Api.userSignin,
      successCallback: (data) {
        Toast.toast(ctx.context,msg: '签到成功');
      },
      errorCallback: (HttpError error) {
        Toast.toast(ctx.context,msg: error.message);
      },
      tag: 'sign');
}

void _init(Action action, Context<SignState> ctx) {
  HttpManager().post(
      url: Api.userTaskList,
      successCallback: (data) {
        ctx.state.signTask = Data.fromJson(data);
        ctx.dispatch(SignActionCreator.onRefreshPage());
      },
      tag: 'userInfo');
}
