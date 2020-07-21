import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_married/widgets/common_item.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {

  void _showEditPersonInfoDialog() {
    showCupertinoDialog(
        context: viewService.context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: Text("还未完善你的资料，暂无法查看！\n完善资料可赠送3次匹配机会"),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("稍后再说",
                    style: TextStyle(fontSize: 18, color: Color(0xff666666))),
              ),
              FlatButton(
                onPressed: () {
//                Navigator.of(context).pushNamed(
//                  'login_page',
//                );
                },
                child: Text(
                  "完善资料",
                  style: TextStyle(fontSize: 18, color: Color(0xffF92431)),
                ),
              ),
            ],
          );
        });
  }

  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        '首页',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    ),
    body: Column(
      children: <Widget>[
        Visibility(
          visible: true,
          child: GestureDetector(
            child: Container(
              height: 55,
              color: Color(0xffFFF9ED),
              padding: EdgeInsets.only(left: 15,right: 15),
              alignment: Alignment.centerLeft,
              child: Row(
                children: <Widget>[
                  Image.asset('assets/2.0x/icon_warning.png',width: 22,height: 22,),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 11.5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('去完善我的个人资料',style: TextStyle(fontSize: 14,color: Color(0xff333333)),),
                          Text('完善资料可获得3次匹配机会',style: TextStyle(fontSize: 12,color: Color(0xffF92431)),),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Icon(Icons.arrow_forward_ios,size: 18,color: Color(0xffF92431),),
                  ),
                ],
              ),
            ),
            onTap: () {},
          ),
        ),

        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CommonItem(context, index,isShowOverlayEntry: false,);
              },
              separatorBuilder: (context, index) {
                return Container(
                  color: Color(0xfff5f5f5),
                  height: 10.5,
                );
              },
              itemCount: 100),
        )
      ],
    ),
  );
}
