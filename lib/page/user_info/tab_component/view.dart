import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_married/page/find_person/action.dart';
import 'package:flutter_married/page/user_info/action.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(TabState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    child: TabBar(
      onTap: (i){
        if (i == 0)
          dispatch(UserInfoActionCreator.onFilterChanged(true));
        else
          dispatch(UserInfoActionCreator.onFilterChanged(false));
      },
      unselectedLabelColor: Color(0xff666666),
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Color(0xff333333),
      labelColor: Color(0xffF333333),
      tabs: <Widget>[
        Tab(text: '资料',),
        Tab(text: '动态',)
      ],
    ),
  );
}
