import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_married/net/api.dart';
import 'package:flutter_married/utils/http/http_error.dart';
import 'package:flutter_married/utils/http/http_manager.dart';
import 'package:flutter_married/widgets/toast.dart';

import 'action.dart';
import 'state.dart';

Effect<EditPasswordState> buildEffect() {
  return combineEffects(<Object, Effect<EditPasswordState>>{
    EditPasswordAction.action: _onAction,
    EditPasswordAction.savePwd: _onSavePwd,
  });
}

void _onAction(Action action, Context<EditPasswordState> ctx) {}

void _onSavePwd(Action action, Context<EditPasswordState> ctx) {
  String oldPwd = ctx.state.oldPwdController.text.toString();
  String newPwd = ctx.state.newPwdController.text.toString();
  Map<String, String> maps = {'newPwd': newPwd, 'oldPwd': oldPwd};
  HttpManager().post(
      url: Api.editUserPwd,
      data: maps,
      successCallback: (data) {
        Toast.toast(ctx.context, msg: data ? "修改成功" : '修改失败');
      },
      errorCallback: (HttpError error){
        Toast.toast(ctx.context,msg: '${error.message}');
      },
      tag: 'editPwd');
}
