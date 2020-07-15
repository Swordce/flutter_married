import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ImproveInformationAction { action,refreshPage,getImage }

class ImproveInformationActionCreator {
  static Action onAction() {
    return const Action(ImproveInformationAction.action);
  }

  static Action onGetImage() {
    return const Action(ImproveInformationAction.getImage);
  }

  static Action onRefresh() {
    return const Action(ImproveInformationAction.refreshPage);
  }
}
