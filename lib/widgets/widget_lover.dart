import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoverView extends StatelessWidget {

  List<String> tags = ['25岁', '本科', '未婚'];
  final int type;

  LoverView({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: GestureDetector(
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
                  ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Image.asset('assets/2.0x/icon_avatar_temp.png',
                          width: 100, height: 120)),
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
                                    fontSize: 15, color: Color(0xff333333)),
                              ),
                            ),
                            Expanded(
                              child: Container(),
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
                        SizedBox(height: 7,),
                        Flexible(
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 20,
                                alignment: Alignment.center,
                                color: Color(0xfff4f4f4),
                                padding: EdgeInsets.only(left: 5, right: 5,top: 2,bottom: 2),
                                child: Text(
                                  '${tags[index]}',
                                  style: TextStyle(
                                      fontSize: 10, color: Color(0xff666666)),
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
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: type == 0?Image.asset('assets/2.0x/icon_love.png',width: 28,height: 28,):Image.asset('assets/2.0x/icon_contact_user.png',width: 52,height: 23,),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          margin: EdgeInsets.only(top: 8.5),
                          child: Text(
                            '我在06-28 17:00收藏了TA',
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
          ],
        ),
      ),
      onTap: () {},
    ));
  }
}
