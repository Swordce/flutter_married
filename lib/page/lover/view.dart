import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(LoverState state, Dispatch dispatch, ViewService viewService) {
  return DefaultTabController(
    length: 2,
    initialIndex: state.initPage,
    child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            '我的良缘',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          leading: IconButton(
            icon: ImageIcon(AssetImage('assets/icon_back.png')),
            color: Colors.white,
            onPressed: () {
              Navigator.of(viewService.context).pop();
            },
          ),
        ),
        body: Column(
          children: <Widget>[
            AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: viewService.buildComponent('tab'),
            ),
            Expanded(
              child:TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  viewService.buildComponent('myLover'),
                  viewService.buildComponent('viewLover'),
                ],
              ),
            ),
          ],
        )),
  );
}
