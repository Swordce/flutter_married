import 'package:dotted_border/dotted_border.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ImproveInformationState state, Dispatch dispatch, ViewService viewService) {
  return SafeArea(
    child: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 160,
            child: Image.asset(
              'assets/icon_improve_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                AppBar(
                  backgroundColor: Colors.transparent,
                  centerTitle: true,
                  title: Text(
                    '完善资料',
                    style: TextStyle(fontSize: 18),
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
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 20),
                        child: Text(
                          '跳过',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(viewService.context).pop();
                      },
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 72),
                  child: GestureDetector(
                    child: Container(
                      width: 82,
                      height: 82,
                      child: Stack(
                        children: <Widget>[
                          Image.asset('assets/icon_camera_bg.png'),
                          state.avatar != null && state.avatar.length > 0 ?ClipOval(
                            child: AssetThumb(
                              asset: state.avatar[0],
                              width: 82,
                              height: 82,
                            ),
                          ):Container(),
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset('assets/icon_camera.png'),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      dispatch(ImproveInformationActionCreator.onGetImage());
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 13),
                  child: Text(
                    '上传真实头像',
                    style: TextStyle(fontSize: 15, color: Color(0xff333333)),
                  ),
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[

                      Container(
                        height: 48,
                        margin: EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          children: <Widget>[
                            Text(
                              '昵称',
                              style:
                              TextStyle(fontSize: 15, color: Color(0xff333333)),
                            ),
                            Expanded(child: Container(
                              margin: EdgeInsets.only(left: 15, right: 15),
                              child: TextField(
                                cursorColor: Color(0xff333333),
                                maxLines: 1,
                                controller: state.nickNameController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '',
                                    hintStyle:
                                    TextStyle(color: Color(0xff333333), fontSize: 15)),
                              ),
                            )),
                          ],
                        ),
                      ),

                      Divider(
                        color: Color(0xffeeeeee),
                        height: 0.5,
                        indent: 15,
                        endIndent: 15,
                      ),
                      Container(
                        height: 48,
                        margin: EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          children: <Widget>[
                            Text(
                              '生日',
                              style:
                              TextStyle(fontSize: 15, color: Color(0xff333333)),
                            ),
                            Expanded(child: Container()),
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Text('${state.birthDay??''}',style: TextStyle(fontSize: 15,color: Color(0xff333333)),),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Color(0xffcccccc),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Color(0xffeeeeee),
                        height: 0.5,
                        indent: 15,
                        endIndent: 15,
                      ),
                      Container(
                        height: 48,
                        margin: EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          children: <Widget>[
                            Text(
                              '身高',
                              style:
                              TextStyle(fontSize: 15, color: Color(0xff333333)),
                            ),
                            Expanded(child: Container()),
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Text('${state.personHeight??''}',style: TextStyle(fontSize: 15,color: Color(0xff333333)),),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Color(0xffcccccc),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Color(0xffeeeeee),
                        height: 0.5,
                        indent: 15,
                        endIndent: 15,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15,top: 14),
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                          border:
                          new Border.all(color: Color(0xFFeeeeee), width: 0.5),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin:EdgeInsets.only(left: 13,right: 13,top: 13,bottom: 5.5),
                              child: TextField(
                                maxLines: 3,
                                controller: state.introduceController,
                                style: TextStyle(color: Color(0xff333333), fontSize: 15),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '介绍下自己吧~',
                                    hintStyle:
                                    TextStyle(color: Color(0xffcccccc), fontSize: 15)),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.only(right: 18.5),
                              child: Text('${state.introduceController.text ==null?0:state.introduceController.text.length}/240',style: TextStyle(fontSize: 12,color: Color(0xffcccccc)),),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15,right: 15,top: 22.5),
                        child: Image.asset('assets/icon_finish_register.png'),
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
  );
}
