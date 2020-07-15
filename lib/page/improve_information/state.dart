import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ImproveInformationState implements Cloneable<ImproveInformationState> {
  TextEditingController introduceController;
  TextEditingController nickNameController;
  String birthDay;
  String personHeight;

  File avatar;
  ImagePicker picker = ImagePicker();

  @override
  ImproveInformationState clone() {
    return ImproveInformationState()
      ..avatar = avatar
      ..picker = picker
      ..introduceController = introduceController
      ..nickNameController = nickNameController
      ..birthDay = birthDay
      ..personHeight = personHeight;
  }
}

ImproveInformationState initState(Map<String, dynamic> args) {
  return ImproveInformationState();
}
