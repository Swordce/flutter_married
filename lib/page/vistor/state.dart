import 'package:fish_redux/fish_redux.dart';

class VistorState implements Cloneable<VistorState> {

  bool isMale = true;
  @override
  VistorState clone() {
    return VistorState()
    ..isMale = isMale;
  }
}

VistorState initState(Map<String, dynamic> args) {
  VistorState state = VistorState();
  state.isMale = args['isMale'];
  return state;
}
