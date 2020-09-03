import 'package:fish_redux/fish_redux.dart';

class OpenVipState implements Cloneable<OpenVipState> {

  int selectIndex = 0;

  @override
  OpenVipState clone() {
    return OpenVipState()..selectIndex = selectIndex;
  }
}

OpenVipState initState(Map<String, dynamic> args) {
  return OpenVipState();
}
