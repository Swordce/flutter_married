import 'package:fish_redux/fish_redux.dart';

class VistorState implements Cloneable<VistorState> {

  bool isMale = true;
  List<String> tags = ['产品经理','165cm','本科','8000-10000元'];
  @override
  VistorState clone() {
    return VistorState()
    ..tags = tags
    ..isMale = isMale;
  }
}

VistorState initState(Map<String, dynamic> args) {
  VistorState state = VistorState();
  state.isMale = args['isMale'];
  return state;
}
