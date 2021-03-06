import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ImproveInformationAction { action,refreshPage,getImage,showDatePicker,getHeight }

class ImproveInformationActionCreator {
  static Action onAction() {
    return const Action(ImproveInformationAction.action);
  }
  static Action onGetHeight(String height) {
    return Action(ImproveInformationAction.getHeight,payload: height);
  }

  static Action onShowDatePicker() {
    return const Action(ImproveInformationAction.showDatePicker);
  }

  static Action onGetImage() {
    return const Action(ImproveInformationAction.getImage);
  }

  static Action onRefresh() {
    return const Action(ImproveInformationAction.refreshPage);
  }
}
