import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    UserInfoState state, Dispatch dispatch, ViewService viewService) {
  return SafeArea(
    child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: Image.asset(
                  'assets/2.0x/icon_userinfo_bg.png',
                  fit: BoxFit.fill,
                  height: 300,
                  width: double.infinity,
                ),
              ),
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: Text(
                  '个人资料',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                leading: IconButton(
                  icon: ImageIcon(AssetImage('assets/icon_back.png')),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(viewService.context).pop();
                  },
                ),
                actions: <Widget>[
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Image.asset(
                        'assets/2.0x/icon_share.png',
                        width: 21,
                        height: 21,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              Container(
                height: 300,
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Visibility(
                      visible: state.isEdit,
                      child: GestureDetector(
                        child: Image.asset(
                          'assets/2.0x/icon_edit_user_bg.png',
                          width: 70,
                          height: 30,
                        ),
                        onTap: () {},
                      ),
                    ),
                    Container(
                      height: 12,
                      margin: EdgeInsets.only(top: 16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/2.0x/icon_bind_wechat.png',
                        height: 42,
                      ),
                      Container(
                        child: Text(
                          state.isEdit ? '绑定微信' : '12****5678',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 10,
                ),
                Flexible(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/2.0x/icon_bind_phone.png',
                        height: 42,
                      ),
                      Container(
                        child: Text(
                          state.isEdit ? '绑定手机号' : '138****9900',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: DefaultTabController(
              length: 2,
              child: Column(
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
                        viewService.buildComponent('info'),
                        viewService.buildComponent('personal_dynamic'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
