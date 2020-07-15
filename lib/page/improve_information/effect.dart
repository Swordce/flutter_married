import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter_married/widgets/datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_married/widgets/datetime_picker/i18n_model.dart';


import 'action.dart';
import 'state.dart';

Effect<ImproveInformationState> buildEffect() {
  return combineEffects(<Object, Effect<ImproveInformationState>>{
    ImproveInformationAction.action: _onAction,
    ImproveInformationAction.getImage: _onGetImage,
    ImproveInformationAction.showDatePicker: _onShowDatePicker,
    Lifecycle.initState:_onInit,
    Lifecycle.dispose:_onDispose,
  });
}

void _onAction(Action action, Context<ImproveInformationState> ctx) {}

void _onShowDatePicker(Action action, Context<ImproveInformationState> ctx) {
  DatePicker.showDatePicker(ctx.context,
      showTitleActions: true,
      minTime: DateTime(1970, 1, 1),
      maxTime: DateTime(2050, 12, 31),onConfirm: (date) {
        ctx.state.birthDay = '${date.year}-${date.month}-${date.day}';
        ctx.dispatch(ImproveInformationActionCreator.onRefresh());
        FocusScope.of(ctx.context).requestFocus(FocusNode());
      },onCancel: (){
        ctx.state.birthDay = '';
        ctx.dispatch(ImproveInformationActionCreator.onRefresh());
        FocusScope.of(ctx.context).requestFocus(FocusNode());
      }, currentTime: DateTime.now(), locale: LocaleType.zh);
}

void _onGetImage(Action action, Context<ImproveInformationState> ctx) async {
  try {
    final resultList = await MultiImagePicker.pickImages(
      maxImages: 1,
      enableCamera: true,
      materialOptions: MaterialOptions(
        actionBarTitle: "Action bar",
        allViewTitle: "选择图片",
        lightStatusBar: false,
        startInAllView: true,
      ),
    );
    ctx.state.avatar = resultList;
    ctx.dispatch(ImproveInformationActionCreator.onRefresh());
  } on Exception catch (e) {
    println('select picture is error ${e.toString()}');
  }

}

void _onInit(Action action, Context<ImproveInformationState> ctx) {
  ctx.state.nickNameController = TextEditingController();
  ctx.state.introduceController = TextEditingController();

  ctx.state.introduceController.addListener(() {
    ctx.dispatch(ImproveInformationActionCreator.onRefresh());
  });
}

void _onDispose(Action action, Context<ImproveInformationState> ctx) {
  ctx.state.nickNameController.dispose();
  ctx.state.introduceController.dispose();
}

