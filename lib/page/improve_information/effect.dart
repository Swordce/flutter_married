import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:image_picker/image_picker.dart';
import 'action.dart';
import 'state.dart';

Effect<ImproveInformationState> buildEffect() {
  return combineEffects(<Object, Effect<ImproveInformationState>>{
    ImproveInformationAction.action: _onAction,
    ImproveInformationAction.getImage: _onGetImage,
    Lifecycle.initState:_onInit,
  });
}

void _onAction(Action action, Context<ImproveInformationState> ctx) {}

void _onGetImage(Action action, Context<ImproveInformationState> ctx) async {
  final ImagePicker _imagePicker = ImagePicker();
  final pickedFile = await _imagePicker.getImage(source: ImageSource.gallery);
  if(pickedFile != null) {
    ctx.state.avatar = File(pickedFile.path);
    ctx.dispatch(ImproveInformationActionCreator.onRefresh());
  }

}

void _onInit(Action action, Context<ImproveInformationState> ctx) {
  ctx.state.nickNameController = TextEditingController();
  ctx.state.introduceController = TextEditingController();

  ctx.state.introduceController.addListener(() {
    ctx.dispatch(ImproveInformationActionCreator.onRefresh());
  });
}
