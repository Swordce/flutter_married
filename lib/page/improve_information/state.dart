import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class ImproveInformationState implements Cloneable<ImproveInformationState> {
  TextEditingController introduceController;
  TextEditingController nickNameController;
  String birthDay;
  String personHeight;

  List<Asset> avatar;

  @override
  ImproveInformationState clone() {
    return ImproveInformationState()
      ..avatar = avatar
      ..introduceController = introduceController
      ..nickNameController = nickNameController
      ..birthDay = birthDay
      ..personHeight = personHeight;
  }
}

ImproveInformationState initState(Map<String, dynamic> args) {
  return ImproveInformationState();
}
