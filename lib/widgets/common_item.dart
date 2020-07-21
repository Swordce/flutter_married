import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommonItem extends StatelessWidget {
  final int index;
  List<String> tags;
  final bool isShowOverlayEntry;
  final BuildContext context;

  CommonItem(
    this.context,
    this.index, {
    Key key,
    this.isShowOverlayEntry,
    this.tags,
  }) : super(key: key);

  void _showDialog() {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("提示"),
            content: Text("抱歉，您还未登录，请登录后查看"),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("取消",
                    style: TextStyle(fontSize: 18, color: Color(0xff666666))),
              ),
              FlatButton(
                onPressed: () {
//                  Navigator.of(context).pushNamedAndRemoveUntil('login_page',(Route<dynamic> route) => false);
                  Navigator.of(context).pushReplacementNamed(
                    'login_page',
                  );
                },
                child: Text(
                  "登录",
                  style: TextStyle(fontSize: 18, color: Color(0xffF92431)),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    tags = ['产品经理','165cm','本科','8000-10000元'];

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        color: Colors.white,
        height: 155,
        padding: EdgeInsets.all(15),
        child: Stack(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Image.asset('assets/2.0x/icon_avatar_temp.png',
                              width: 100, height: 120)),
                      Visibility(
                        visible: index % 5== 2,
                        child: Container(
                          child: Image.asset(
                            'assets/2.0x/icon_real_name.png',
                            width: 32,
                            height: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                '周冰冰',
                                style: TextStyle(
                                    fontSize: 13, color: Color(0xff333333)),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '30岁 | 未婚',
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xff333333)),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '福建 厦门',
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xff999999)),
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ],
                        ),
                        tags != null && tags.length > 0
                            ? Container(
                                height: 15,
                                margin: EdgeInsets.only(top: 8),
                                child: ListView.separated(
                                  shrinkWrap: false,
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      alignment: Alignment.center,
                                      color: Color(0xffFFECE3),
                                      padding:
                                          EdgeInsets.only(left: 5, right: 5),
                                      child: Text(
                                        '${tags[index]}',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xffFF6010)),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Container(
                                      color: Colors.white,
                                      width: 7.5,
                                    );
                                  },
                                  itemCount: tags.length,
                                )
                              )
                            : Container(),
                        Container(
                          color: Color(0xffF5F5F5),
                          margin: EdgeInsets.only(top: 8.5),
                          padding: EdgeInsets.all(8),
                          child: Text(
                            '能静能动的优秀女青年，会赚钱还能勤俭持家，上得厅堂下得厨房的好女子，希望找个三观相同的人为伴',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color(0xff666666), fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Visibility(
              visible: (isShowOverlayEntry == null && index % 4 == 1)? true : isShowOverlayEntry,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Container(
                  height: 149.5,
                  child: Stack(
                    children: <Widget>[
                      Opacity(
                        opacity: 0.9,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Chip(
                          backgroundColor: Color(0xffEB3040),
                          avatar: Image.asset(
                            'assets/2.0x/icon_private.png',
                            width: 12.5,
                            height: 15,
                          ),
                          label: Text('该用户仅对注册用户可见'),
                          labelStyle:
                              TextStyle(fontSize: 12, color: Colors.white),
                          labelPadding: EdgeInsets.only(left: 7.5, right: 17),
                          padding:
                              EdgeInsets.only(left: 17, top: 7.5, bottom: 7.5),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  _showDialog();
                },
              ),
            )
          ],
        ),
      ),
      onTap: () {
        _showDialog();
      },
    );
  }
}
