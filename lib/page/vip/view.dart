import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_married/bean/vip_hint.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    OpenVipState state, Dispatch dispatch, ViewService viewService) {
  Widget _buildRow() {
    return Row(
      children: <Widget>[
        Flexible(
          child: GestureDetector(
            onTap: () {
              dispatch(OpenVipActionCreator.onChangeIndex(0));
            },
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Image.asset(
                  state.selectIndex == 0
                      ? 'assets/2.0x/icon_vip_checked.png'
                      : 'assets/2.0x/icon_vip_uncheck.png',
                  fit: BoxFit.fill,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '单次卡',
                        style:
                            TextStyle(color: Color(0xff333333), fontSize: 15),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      RichText(
                        text: TextSpan(
                          text: '￥',
                          style:
                              TextStyle(fontSize: 10, color: Color(0xffF92431)),
                          children: <TextSpan>[
                            TextSpan(
                              text: '2',
                              style: TextStyle(
                                  fontSize: 24, color: Color(0xffF92431)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        '1人1次',
                        style:
                            TextStyle(color: Color(0xff999999), fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: GestureDetector(
            onTap: () {
              dispatch(OpenVipActionCreator.onChangeIndex(1));
            },
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Image.asset(
                  state.selectIndex == 1
                      ? 'assets/2.0x/icon_vip_checked.png'
                      : 'assets/2.0x/icon_vip_uncheck.png',
                  fit: BoxFit.fill,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '月卡',
                        style:
                            TextStyle(color: Color(0xff333333), fontSize: 15),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      RichText(
                        text: TextSpan(
                          text: '￥',
                          style:
                              TextStyle(fontSize: 10, color: Color(0xffF92431)),
                          children: <TextSpan>[
                            TextSpan(
                              text: '9.9',
                              style: TextStyle(
                                  fontSize: 24, color: Color(0xffF92431)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        '5次/天',
                        style:
                            TextStyle(color: Color(0xff999999), fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: GestureDetector(
            onTap: () {
              dispatch(OpenVipActionCreator.onChangeIndex(2));
            },
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Image.asset(
                  state.selectIndex == 2
                      ? 'assets/2.0x/icon_vip_checked.png'
                      : 'assets/2.0x/icon_vip_uncheck.png',
                  fit: BoxFit.fill,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '年卡',
                        style:
                            TextStyle(color: Color(0xff333333), fontSize: 15),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      RichText(
                        text: TextSpan(
                          text: '￥',
                          style:
                              TextStyle(fontSize: 10, color: Color(0xffF92431)),
                          children: <TextSpan>[
                            TextSpan(
                              text: '69',
                              style: TextStyle(
                                  fontSize: 24, color: Color(0xffF92431)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        '不限次数',
                        style:
                            TextStyle(color: Color(0xff999999), fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildItem(index) {
    return GestureDetector(
      onTap: () {
        dispatch(OpenVipActionCreator.onChangeIndex(index));
      },
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Image.asset(
            state.selectIndex == index
                ? 'assets/2.0x/icon_vip_checked.png'
                : 'assets/2.0x/icon_vip_uncheck.png',
            fit: BoxFit.fill,
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Text(
                  state.products[index].name,
                  style:
                  TextStyle(color: Color(0xff333333), fontSize: 15),
                ),
                SizedBox(
                  height: 6,
                ),
                RichText(
                  text: TextSpan(
                    text: '￥',
                    style:
                    TextStyle(fontSize: 10, color: Color(0xffF92431)),
                    children: <TextSpan>[
                      TextSpan(
                        text: '${state.products[index].money}',
                        style: TextStyle(
                            fontSize: 24, color: Color(0xffF92431)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  '${state.products[index].describeInfo}',
                  style:
                  TextStyle(color: Color(0xff999999), fontSize: 12),
                ),
              ],
            ),
          ),
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
        '良缘VIP',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
      leading: IconButton(
        icon: ImageIcon(AssetImage('${Constants.imgPreSuffix}icon_back.png')),
        color: Colors.white,
        onPressed: () {
          Navigator.of(viewService.context).pop();
        },
      ),
    ),
    body: CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 22,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '连签7天领会员',
                          style:
                              TextStyle(color: Color(0xff333333), fontSize: 15),
                        ),
                        Flexible(
                          child: Container(),
                        ),
                        Image.asset(
                          'assets/2.0x/icon_go_sign.png',
                          width: 52,
                          height: 23,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 23.5,
                    ),
                    GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, crossAxisSpacing: 5),
                        shrinkWrap: true,
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          return _buildItem(index);
                        }),
                    SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      child: Image.asset(
                        'assets/2.0x/icon_btn_vip.png',
                        width: double.infinity,
                        height: 42,
                      ),
                      onTap: (){
                        dispatch(OpenVipActionCreator.onPay());
                      },
                    ),
                    SizedBox(
                      height: 25,
                    )
                  ],
                ),
              ),
              Container(
                color: Color(0xfff5f5f5),
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 28.5,
                    ),
                    Image.asset(
                      'assets/2.0x/icon_vip_hint.png',
                      width: 133.5,
                      height: 24.5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 38),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xfff1f1f1),
                      width: 0.5,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        Constants.imgs[index],
                        width: 44,
                        height: 44,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '${Constants.texts[index]}',
                        style:
                            TextStyle(color: Color(0xff666666), fontSize: 11),
                      ),
                    ],
                  ));
            }, childCount: 6),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 0.7),
          ),
        ),
      ],
    ),
  );
}
