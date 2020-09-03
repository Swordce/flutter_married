import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_married/widgets/widget_lover.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(ViewLoverState state, Dispatch dispatch, ViewService viewService) {
  return keepAliveClientWrapper(Scaffold(
    body: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return LoverView(type: 1,);
        },
        separatorBuilder: (context, index) {
          return Container(
            color: Color(0xfff5f5f5),
            height: 10.5,
          );
        },
        itemCount: 100),
  ));}
