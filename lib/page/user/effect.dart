import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_married/bean/user_info.dart';
import 'package:flutter_married/net/api.dart';
import 'package:flutter_married/utils/http/http_error.dart';
import 'package:flutter_married/utils/http/http_manager.dart';
import 'package:flutter_married/widgets/toast.dart';
import 'action.dart';
import 'state.dart';

Effect<UserState> buildEffect() {
  return combineEffects(<Object, Effect<UserState>>{
    UserAction.action: _onAction,
    Lifecycle.initState:_init,
    UserAction.refreshUser:_getUserInfo,
  });
}

void _onAction(Action action, Context<UserState> ctx) {}

void _init(Action action, Context<UserState> ctx) {
  _getUserInfo(action, ctx);
}

void _getUserInfo(Action action, Context<UserState> ctx) {
  HttpManager().get(url: Api.userInfo,successCallback: (data){
    ctx.state.basicInfo = BasicInfo.fromJson(data['basicInfo']);
    ctx.dispatch(UserActionCreator.onRefreshPage());
  },errorCallback: (HttpError error){
    Toast.toast(ctx.context,msg: error.message);
  }, tag: 'userInfo');

}
