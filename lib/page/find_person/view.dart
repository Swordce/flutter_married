import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    FindPersonState state, Dispatch dispatch, ViewService viewService) {
  return DefaultTabController(
    length: 2,
    child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            '找对象',
            style: TextStyle(fontSize: 18, color: Colors.white),
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
                  viewService.buildComponent('personal'),
                  viewService.buildComponent('find'),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 15, right: 15,bottom: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Visibility(
                    visible: true,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 15,top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/2.0x/icon_warning.png',
                                width: 18,
                                height: 18,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 7),
                                child: Text('还未补充基本资料',style: TextStyle(fontSize: 15,color: Color(0xff333333)),),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: Text('前去补充',style: TextStyle(fontSize: 15,color: Color(0xff999999)),),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Color(0xffcccccc),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 0.5,
                          color: Color(0xffeeeeee),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child:GestureDetector(
                          child:  Container(
                            height: 42,
                            child: Image.asset('assets/2.0x/icon_random_find.png'),
                          ),
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Navigator.of(viewService.context).pushNamed('find_result',arguments: {'random':true});
                          },
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Flexible(
                        child: GestureDetector(
                          child: Container(
                            height: 42,
                            child: state.findUnlock?Image.asset('assets/2.0x/icon_precise_unlock.png'):Image.asset('assets/2.0x/icon_precise_find.png'),
                          ),
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Navigator.of(viewService.context).pushNamed('find_result',arguments: {'random':false});
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        )),
  );
}
