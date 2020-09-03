import 'package:fish_redux/fish_redux.dart';

class DiscussionDetailState implements Cloneable<DiscussionDetailState> {

  @override
  DiscussionDetailState clone() {
    return DiscussionDetailState();
  }
}

DiscussionDetailState initState(Map<String, dynamic> args) {
  return DiscussionDetailState();
}
