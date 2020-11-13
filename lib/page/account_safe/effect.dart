import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_married/bean/user_info.dart';
import 'package:flutter_married/net/api.dart';
import 'package:flutter_married/utils/http/http_manager.dart';

import 'action.dart';
import 'state.dart';

Effect<AccountSafeState> buildEffect() {
  return combineEffects(<Object, Effect<AccountSafeState>>{
    AccountSafeAction.action: _onAction,
    AccountSafeAction.getUserInfo: _getUserInfo,
    Lifecycle.initState: _init,
  });
}

void _onAction(Action action, Context<AccountSafeState> ctx) {}

void _init(Action action, Context<AccountSafeState> ctx) {
  _getUserInfo(action, ctx);
}

void _getUserInfo(Action action, Context<AccountSafeState> ctx) {
  HttpManager().get(
      url: Api.userInfo,
      successCallback: (data) {
        ctx.state.basicInfo = BasicInfo.fromJson(data['basicInfo']);
        println('${ctx.state.basicInfo.phone}');
        ctx.dispatch(AccountSafeActionCreator.onRefreshPage());
      },
      tag: 'userInfo');
}
