import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_married/bean/vip_package_list.dart';

class OpenVipState implements Cloneable<OpenVipState> {

  int selectIndex = 0;
  List<Data> products = new List<Data>();

  @override
  OpenVipState clone() {
    return OpenVipState()..selectIndex = selectIndex..products=products;
  }
}

OpenVipState initState(Map<String, dynamic> args) {
  return OpenVipState();
}
