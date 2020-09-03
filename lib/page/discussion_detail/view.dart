import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(DiscussionDetailState state, Dispatch dispatch, ViewService viewService) {

  Widget _buildHeader() {
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
                Container(
                  width: 14,
                  height: 14,
                  child: Image.asset('assets/2.0x/icon_more.png'),
                )
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

  Widget _buildItem(int index) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 19, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              width: 40,
              height: 40,
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
                    TextStyle(color: Color(0xff666666), fontSize: 14),
                  ),
                  Text(
                    '25岁 厦门',
                    style:
                    TextStyle(color: Color(0xff999999), fontSize: 12),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      '日子很狗，但我不敢骂他，怕他疯狂咬我',
                      style: TextStyle(color: Color(0xff333333), fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Text(
              '15:10',
              style:
              TextStyle(color: Color(0xff999999), fontSize: 12),
            ),
          )
        ],
      ),
    );
  }

  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        '动态详情',
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
    body: Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: _buildHeader(),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Color(0xffF5F5F5),
              height: 10,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context,int index){
              final int itemIndex = index ~/ 2;
              if(index.isEven) {
                return _buildItem(itemIndex);
              }
              return Divider(height: 0.5,);
            },childCount: 5 * 2 - 1),
          )
        ],
      ),
    ),
  );
}
