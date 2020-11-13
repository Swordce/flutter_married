import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(SignState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Color(0xfff5f5f5),
    body: Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 332,
          child: Image.asset(
            'assets/2.0x/icon_sign.png',
            fit: BoxFit.cover,
          ),
        ),
        ListView(
          children: [
            Container(
              child: Column(
                children: <Widget>[

                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      width: 101,
                      height: 101,
                      margin: EdgeInsets.only(top: 106, bottom: 17),
                      child: Image.asset(
                        'assets/2.0x/icon_signin.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    onTap: (){
                      dispatch(SignActionCreator.onSign());
                    },
                  ),
                  Text(
                    '连续签到7天可获得良缘会员',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  Container(
                    height: 131,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      // 底色
                      //        borderRadius: new BorderRadius.circular((20.0)), // 圆角度
                      borderRadius: new BorderRadius.all(
                          Radius.circular(5)), // 也可控件一边圆角大小
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: 14, right: 14, top: 17, bottom: 15),
                          child: Row(
                            children: [
                              Text(
                                '已连续签到',
                                style: TextStyle(
                                    color: Color(0xff666666), fontSize: 15),
                              ),
                              Text(
                                state.signTask != null
                                    ? '${state.signTask.signDay}'
                                    : '0',
                                style: TextStyle(
                                    color: Color(0xffF92431), fontSize: 15),
                              ),
                              Text(
                                '天',
                                style: TextStyle(
                                    color: Color(0xff666666), fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 7,
                                    crossAxisSpacing: 0.2,
                                    mainAxisSpacing: 0.2),
                            shrinkWrap: true,
                            itemCount: 7,
                            itemBuilder: (context, index) {
                              if (state.signTask != null &&
                                  state.signTask.signDay != null &&
                                  state.signTask.signDay > 0 &&
                                  (index + 1) <= state.signTask.signDay) {
                                return Image.asset(
                                    'assets/2.0x/icon_has_signin.png');
                              }
                              return Image.asset(state.iconSigns[index]);
                            }),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(
                        left: 15, right: 15, top: 20, bottom: 20),
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.all(Radius.circular(5)),
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          height: 55,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 15, right: 15),
                                padding: EdgeInsets.all(0),
                                child: Text(
                                  '绑定手机号',
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xff333333)),
                                ),
                              ),
                              Flexible(child: Container()),
                              Container(
                                height: 23,
                                width: 52,
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(right: 15),
                                decoration: state.signTask == null || state.signTask.bindingPhone == 0
                                    ? BoxDecoration(
                                        color: Color(0x1aF92431),
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(11.5)),
                                      )
                                    : BoxDecoration(
                                        color: Color(0x1aededed),
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(11.5)),
                                      ),
                                child: state.signTask == null || state.signTask.bindingPhone == 0
                                    ? Text(
                                        '做任务',
                                        style: TextStyle(
                                            color: Color(0xffF92431),
                                            fontSize: 11),
                                      )
                                    : Text(
                                        '已完成',
                                        style: TextStyle(
                                            color: Color(0xff999999),
                                            fontSize: 11),
                                      ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                          endIndent: 15,
                          indent: 15,
                          color: Color(0xffeeeeee),
                        ),
                        Container(
                          height: 55,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 15, right: 15),
                                padding: EdgeInsets.all(0),
                                child: Text(
                                  '绑定微信',
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xff333333)),
                                ),
                              ),
                              Flexible(child: Container()),
                              Container(
                                height: 23,
                                width: 52,
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(right: 15),
                                decoration: state.signTask == null || state.signTask.bindingWx == 0
                                    ? BoxDecoration(
                                        color: Color(0x1aF92431),
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(11.5)),
                                      )
                                    : BoxDecoration(
                                        color: Color(0x1aededed),
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(11.5)),
                                      ),
                                child: state.signTask == null || state.signTask.bindingWx == 0
                                    ? Text(
                                        '做任务',
                                        style: TextStyle(
                                            color: Color(0xffF92431),
                                            fontSize: 11),
                                      )
                                    : Text(
                                        '已完成',
                                        style: TextStyle(
                                            color: Color(0xff999999),
                                            fontSize: 11),
                                      ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                          endIndent: 15,
                          indent: 15,
                          color: Color(0xffeeeeee),
                        ),
                        Container(
                          height: 55,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 15, right: 15),
                                padding: EdgeInsets.all(0),
                                child: Text(
                                  '补充基本资料',
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xff333333)),
                                ),
                              ),
                              Flexible(child: Container()),
                              Container(
                                height: 23,
                                width: 52,
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(right: 15),
                                decoration: state.signTask == null || state.signTask.supplementData == 0
                                    ? BoxDecoration(
                                        color: Color(0x1aF92431),
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(11.5)),
                                      )
                                    : BoxDecoration(
                                        color: Color(0x1aededed),
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(11.5)),
                                      ),
                                child: state.signTask == null || state.signTask.supplementData == 0
                                    ? Text(
                                        '做任务',
                                        style: TextStyle(
                                            color: Color(0xffF92431),
                                            fontSize: 11),
                                      )
                                    : Text(
                                        '已完成',
                                        style: TextStyle(
                                            color: Color(0xff999999),
                                            fontSize: 11),
                                      ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                          endIndent: 15,
                          indent: 15,
                          color: Color(0xffeeeeee),
                        ),
                        Container(
                          height: 55,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 15, right: 15),
                                padding: EdgeInsets.all(0),
                                child: Text(
                                  '发布动态',
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xff333333)),
                                ),
                              ),
                              Flexible(child: Container()),
                              Container(
                                height: 23,
                                width: 52,
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(right: 15),
                                decoration: state.signTask == null || state.signTask.releaseNews == 0
                                    ? BoxDecoration(
                                        color: Color(0x1aF92431),
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(11.5)),
                                      )
                                    : BoxDecoration(
                                        color: Color(0x1aededed),
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(11.5)),
                                      ),
                                child: state.signTask == null || state.signTask.releaseNews == 0
                                    ? Text(
                                        '做任务',
                                        style: TextStyle(
                                            color: Color(0xffF92431),
                                            fontSize: 11),
                                      )
                                    : Text(
                                        '已完成',
                                        style: TextStyle(
                                            color: Color(0xff999999),
                                            fontSize: 11),
                                      ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                          endIndent: 15,
                          indent: 15,
                          color: Color(0xffeeeeee),
                        ),
                        Container(
                          height: 55,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 15, right: 15),
                                padding: EdgeInsets.all(0),
                                child: Text(
                                  '实名认证',
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xff333333)),
                                ),
                              ),
                              Flexible(child: Container()),
                              Container(
                                height: 23,
                                width: 52,
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(right: 15),
                                decoration: state.signTask == null || state.signTask.authName == 0
                                    ? BoxDecoration(
                                        color: Color(0x1aF92431),
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(11.5)),
                                      )
                                    : BoxDecoration(
                                        color: Color(0x1aededed),
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(11.5)),
                                      ),
                                child: state.signTask == null || state.signTask.authName == 0
                                    ? Text(
                                        '做任务',
                                        style: TextStyle(
                                            color: Color(0xffF92431),
                                            fontSize: 11),
                                      )
                                    : Text(
                                        '已完成',
                                        style: TextStyle(
                                            color: Color(0xff999999),
                                            fontSize: 11),
                                      ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                          endIndent: 15,
                          indent: 15,
                          color: Color(0xffeeeeee),
                        ),
                        Container(
                          height: 55,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 15, right: 15),
                                padding: EdgeInsets.all(0),
                                child: Text(
                                  '房屋认证',
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xff333333)),
                                ),
                              ),
                              Flexible(child: Container()),
                              Container(
                                height: 23,
                                width: 52,
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(right: 15),
                                decoration: state.signTask == null || state.signTask.authHouse == 0
                                    ? BoxDecoration(
                                        color: Color(0x1aF92431),
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(11.5)),
                                      )
                                    : BoxDecoration(
                                        color: Color(0x1aededed),
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(11.5)),
                                      ),
                                child: state.signTask == null || state.signTask.authHouse == 0
                                    ? Text(
                                        '做任务',
                                        style: TextStyle(
                                            color: Color(0xffF92431),
                                            fontSize: 11),
                                      )
                                    : Text(
                                        '已完成',
                                        style: TextStyle(
                                            color: Color(0xff999999),
                                            fontSize: 11),
                                      ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                          endIndent: 15,
                          indent: 15,
                          color: Color(0xffeeeeee),
                        ),
                        Container(
                          height: 55,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 15, right: 15),
                                padding: EdgeInsets.all(0),
                                child: Text(
                                  '车辆认证',
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xff333333)),
                                ),
                              ),
                              Flexible(child: Container()),
                              Container(
                                height: 23,
                                width: 52,
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(right: 15),
                                decoration: state.signTask == null || state.signTask.authCar == 0
                                    ? BoxDecoration(
                                        color: Color(0x1aF92431),
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(11.5)),
                                      )
                                    : BoxDecoration(
                                        color: Color(0x1aededed),
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(11.5)),
                                      ),
                                child: state.signTask == null || state.signTask.authCar == 0
                                    ? Text(
                                        '做任务',
                                        style: TextStyle(
                                            color: Color(0xffF92431),
                                            fontSize: 11),
                                      )
                                    : Text(
                                        '已完成',
                                        style: TextStyle(
                                            color: Color(0xff999999),
                                            fontSize: 11),
                                      ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                          endIndent: 15,
                          indent: 15,
                          color: Color(0xffeeeeee),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
          height: 88,
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              '签到中心',
              style: TextStyle(fontSize: 18),
            ),
            leading: IconButton(
              icon: ImageIcon(AssetImage('assets/icon_back.png')),
              color: Colors.white,
              onPressed: () {
                Navigator.of(viewService.context).pop();
              },
            ),
          ),
        ),
      ],
    ),
  );
}
