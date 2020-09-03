import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_married/widgets/widget_horizontal_view.dart';
import 'package:flutter_married/widgets/widget_vertical_view.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(UserState state, Dispatch dispatch, ViewService viewService) {

  Widget _buildBorder(String iconPath,String text) {
    return Container(
      width: 50,
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(iconPath,width: 11,height: 11,),
          Container(
            margin: EdgeInsets.only(left: 3),
            child: Text('$text',style: TextStyle(color: Colors.white,fontSize: 10),),
          ),
        ],
      ),
      decoration: new BoxDecoration(
        border: new Border.all(color: Colors.white, width: 0.5),
        borderRadius: new BorderRadius.all(Radius.circular(15)),
      ),
    );
  }

  return Scaffold(
    backgroundColor: Colors.white,
    body: Column(
      children: <Widget>[
        Container(
          height: 250,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                child: Image.network(
                  "http://img.redocn.com/sheying/20150213/mulanweichangcaoyuanfengjing_3951976.jpg",
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.fill,
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.white.withAlpha(0),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 48.5),
                child: Column(
                  children: <Widget>[
                    
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child: Image.asset('assets/2.0x/icon_user_edit.png',width: 20,height: 20,),
                      alignment: Alignment.topRight,
                    ),
                    
                    Container(
                        width: 82,
                        height: 82,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'http://img.redocn.com/sheying/20150213/mulanweichangcaoyuanfengjing_3951976.jpg'),
                                fit: BoxFit.cover))),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '测试帐号',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '良缘号:1234567',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildBorder('assets/2.0x/icon_user_sex.png', '30岁'),
                        SizedBox(
                          width: 10,
                        ),
                        _buildBorder('assets/2.0x/icon_user_location.png', '厦门'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 93,
          child: Row(
            children: <Widget>[
              Flexible(
                child: CommonVerticalView(
                  iconPath: 'assets/2.0x/icon_user_info.png',
                  text: '个人资料',
                  onPressed: () {},
                ),
              ),
              Flexible(
                child: CommonVerticalView(
                  iconPath: 'assets/2.0x/icon_user_dynamic.png',
                  text: '我的动态',
                ),
              ),
              Flexible(
                child: CommonVerticalView(
                  iconPath: 'assets/2.0x/icon_user_authorizan.png',
                  text: '认证信息',
                ),
              ),
            ],
          ),
        ),
        Flexible(
            child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            CommonHorizontalView(
              iconPath: 'assets/2.0x/icon_user_vip.png',
              text: '良缘VIP',
              showRightText: true,
              rightText: '单次卡',
              rightTextColor: 0xffFFA600,
              onPressed: (){
                Navigator.of(viewService.context).pushNamed('open_vip');
              },
            ),
            CommonHorizontalView(
              iconPath: 'assets/2.0x/icon_user_sign.png',
              text: '签到领会员',
              showRightText: true,
              rightText: '已签到',
            ),
            Divider(
              height: 0.5,
              color: Color(0xffeeeeeeee),
              indent: 15,
            ),
            SizedBox(
              height: 15,
            ),
            CommonHorizontalView(
              iconPath: 'assets/2.0x/icon_user_mylover.png',
              text: '我的良缘',
              onPressed: (){
                Navigator.of(viewService.context).pushNamed('lover',arguments: {'initPage':0});
              },
            ),
            CommonHorizontalView(
              iconPath: 'assets/2.0x/icon_user_visible.png',
              text: '谁看过我',
              onPressed: (){
                Navigator.of(viewService.context).pushNamed('lover',arguments: {'initPage':1});
              }
            ),
            CommonHorizontalView(
              iconPath: 'assets/2.0x/icon_user_item_dynamic.png',
              text: '我的动态',
            ),
            Divider(
              height: 0.5,
              color: Color(0xffeeeeeeee),
              indent: 15,
            ),
            SizedBox(
              height: 15,
            ),
            CommonHorizontalView(
              iconPath: 'assets/2.0x/icon_user_setting.png',
              text: '设置',
            ),
            Divider(
              height: 0.5,
              color: Color(0xffeeeeeeee),
              indent: 15,
            ),
            SizedBox(
              height: 15,
            ),
          ],
        )),
      ],
    ),
  );
}
