import 'package:fish_redux/fish_redux.dart';

class DiscussionState implements Cloneable<DiscussionState> {

  @override
  DiscussionState clone() {
    return DiscussionState();
  }
}

DiscussionState initState(Map<String, dynamic> args) {
  return DiscussionState();
}
