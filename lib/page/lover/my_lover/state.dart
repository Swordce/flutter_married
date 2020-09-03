import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_married/page/lover/state.dart';

class MyLoverState implements Cloneable<MyLoverState> {

  @override
  MyLoverState clone() {
    return MyLoverState();
  }
}

class MyLoverConnector extends ConnOp<LoverState, MyLoverState> {
  @override
  MyLoverState get(LoverState state) {
    MyLoverState subState = MyLoverState();
    return subState;
  }
}