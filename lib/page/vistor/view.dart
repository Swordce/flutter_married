import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_married/widgets/common_item.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    VistorState state, Dispatch dispatch, ViewService viewService) {
  return SafeArea(
    child: Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          '随便看看',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        leading: Container(),
//        leading: IconButton(
//          icon: ImageIcon(AssetImage('assets/icon_back.png')),
//          color: Colors.white,
//          onPressed: () {
//            SystemNavigator.pop();
//            //            Navigator.of(viewService.context).pop();
//          },
//        ),
      ),
      body: WillPopScope(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return CommonItem(context,index);
            },
            separatorBuilder: (context, index) {
              return Container(
                color: Color(0xfff5f5f5),
                height: 10.5,
              );
            },
            itemCount: 100),
        onWillPop: () async {
          SystemNavigator.pop();
          return true;
        },
      ),
    ),
  );
}
