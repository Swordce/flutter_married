import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    DiscussionState state, Dispatch dispatch, ViewService viewService) {
  Widget _buildItem(int index) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 19, bottom: 10),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/2.0x/icon_temp_user.png'),
                            fit: BoxFit.cover))),
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '任妍妍',
                          style:
                              TextStyle(color: Color(0xff333333), fontSize: 15),
                        ),
                        Container(
                          height: 6,
                        ),
                        Text(
                          '11:48 25岁 厦门',
                          style:
                              TextStyle(color: Color(0xff666666), fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    width: 14,
                    height: 14,
                    child: Image.asset('assets/2.0x/icon_more.png'),
                  ),
                  onTap: (){
                  },
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 10.5, bottom: 15),
            child: Text(
              '爱你的人 你皱了眉 他都会心疼\n不爱你的人 你上吊了 他都觉得你在荡秋千    ',
              style: TextStyle(color: Color(0xff333333), fontSize: 14),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 5),
              children: <Widget>[
                Image.asset('assets/2.0x/icon_temp_bg1.png'),
                Image.asset('assets/2.0x/icon_temp_bg1.png'),
                Image.asset('assets/2.0x/icon_temp_bg1.png'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 11),
            child: Divider(
              height: 0.5,
              color: Color(0xffEEEEEE),
            ),
          ),
          Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      child: Image.asset('assets/2.0x/icon_parise.png',width: 14,height: 14,),
                    ),
                    Text('14',style: TextStyle(color: Color(0xff666666),fontSize: 13),)
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      child: Image.asset('assets/2.0x/icon_comment.png',width: 14,height: 14,),
                    ),
                    Text('230',style: TextStyle(color: Color(0xff666666),fontSize: 13),)
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Image.asset('assets/2.0x/icon_contact.png',width: 41.5,height: 11.5,),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        '社区',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    ),
    body: ListView.separated(
        itemBuilder: (context, index) {
          return GestureDetector(
            child: _buildItem(index),
            onTap: (){
              Navigator.of(viewService.context).pushNamed('discussion_detail');
            },
          );
        },
        separatorBuilder: (context, index) {
          return Container(
            color: Color(0xffF5F5F5),
            height: 10,
          );
        },
        itemCount: 100),
  );
}
