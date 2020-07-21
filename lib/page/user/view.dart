import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(UserState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        '我的',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    ),
    body: ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          child: Text('$index'),
        );
      },
      itemCount: 100,
    ),
  );
}
