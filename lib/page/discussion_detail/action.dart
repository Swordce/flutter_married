import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum DiscussionDetailAction { action }

class DiscussionDetailActionCreator {
  static Action onAction() {
    return const Action(DiscussionDetailAction.action);
  }
}
