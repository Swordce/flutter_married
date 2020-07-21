import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum DiscussionAction { action }

class DiscussionActionCreator {
  static Action onAction() {
    return const Action(DiscussionAction.action);
  }
}
