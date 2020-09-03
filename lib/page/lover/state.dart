import 'package:fish_redux/fish_redux.dart';

class LoverState implements Cloneable<LoverState> {

  bool showMyLover;
  int initPage;

  @override
  LoverState clone() {
    return LoverState()..showMyLover = showMyLover..initPage = initPage;
  }
}

LoverState initState(Map<String, dynamic> args) {
  LoverState state = LoverState();
  state.showMyLover = true;
  state.initPage = args['initPage'];
  return state;
}
