import 'package:fish_redux/fish_redux.dart';

class FindResultState implements Cloneable<FindResultState> {

  bool isRandom = false;

  @override
  FindResultState clone() {
    return FindResultState()..isRandom = isRandom;
  }
}

FindResultState initState(Map<String, dynamic> args) {
  return FindResultState()..isRandom = args['random'];
}
