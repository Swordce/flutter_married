import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_married/page/find_person/action.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(TabState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    child: TabBar(
      onTap: (i){
        if (i == 0)
          dispatch(FindPersonActionCreator.onFilterChanged(true));
        else
          dispatch(FindPersonActionCreator.onFilterChanged(false));
      },
      unselectedLabelColor: Color(0xff666666),
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Color(0xffF92431),
      labelColor: Color(0xffF92431),
      tabs: <Widget>[
        Tab(text: '我的情况',),
        Tab(text: '补全资料',)
      ],
    ),
  );
}
