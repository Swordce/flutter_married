import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_alipay/flutter_alipay.dart';
import 'package:flutter_married/bean/vip_package_list.dart';
import 'package:flutter_married/net/api.dart';
import 'package:flutter_married/utils/http/http_manager.dart';
import 'package:flutter_married/utils/sp_util.dart';
import 'action.dart';
import 'state.dart';

Effect<OpenVipState> buildEffect() {
  return combineEffects(<Object, Effect<OpenVipState>>{
    OpenVipAction.action: _onAction,
    OpenVipAction.changeIndex: _onChangeIndex,
    Lifecycle.initState: _init,
    OpenVipAction.payOrder:_pay,
  });
}

void _onAction(Action action, Context<OpenVipState> ctx) {}

void _pay(Action action, Context<OpenVipState> ctx) {
  HttpManager().post(url: Api.rechargeUrl,
      data: {'type':"1","id":ctx.state.products[ctx.state.selectIndex].id},
      successCallback: (data) async {
        var result = await FlutterAlipay.pay(data);
        println('pay result=$result');
      },
      tag: 'recharge');
}

void _init(Action action, Context<OpenVipState> ctx) {
  String token = SpUtil().getString("token");
  HttpManager().get(
      url: Api.packageListUrl,
      options: Options(headers: {'Authorization': token}),
      successCallback: (data) {
        data.forEach((v) {
          ctx.state.products.add(new Data.fromJson(v));
          ctx.dispatch(OpenVipActionCreator.onRefreshPage());
        });
      },
      tag: 'packageList');
}

void _onChangeIndex(Action action, Context<OpenVipState> ctx) {
  ctx.state.selectIndex = action.payload;
  println(action.payload);
  ctx.dispatch(OpenVipActionCreator.onRefreshPage());
}
