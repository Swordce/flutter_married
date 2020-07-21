import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_married/page/find_person/action.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(PersonalState state, Dispatch dispatch, ViewService viewService) {
  return keepAliveClientWrapper(Scaffold(
    backgroundColor: Colors.white,
    body: CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Container(
                  height: 48,
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: <Widget>[
                      Text(
                        state.personalConditions[index].key,
                        style: TextStyle(
                            fontSize: 15, color: Color(0xff333333)),
                      ),
                      Expanded(child: Container()),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: state.personalConditions[index].value.isEmpty?Text(
                          '待补充',
                          style: TextStyle(
                              fontSize: 15, color: Color(0xff999999)),
                        ):Text(
                          '${state.personalConditions[index].value}',
                          style: TextStyle(
                              fontSize: 15, color: Color(0xff666666)),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Color(0xffcccccc),
                      ),
                    ],
                  ),
                ),
                onTap: () {
//            _showBottomSheetDialog();
                },
              );
            },
            separatorBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                color: Color(0xfff5f5f5),
                height: 0.5,
              );
            },
            itemCount: state.personalExtend?state.personalConditions.length:7,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 48,
            child: GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 4.5),
                    child: Text(state.personalExtend?'收起':'更多资料',style: TextStyle(fontSize: 14,color: Color(0xffF92431)),),
                  ),
                  Image.asset(state.personalExtend?'assets/2.0x/icon_circle_arrow_up.png':"assets/2.0x/icon_circle_arrow_down.png",width: 16,height: 16,)
                ],
              ),
              behavior: HitTestBehavior.opaque,
              onTap: () {
                dispatch(FindPersonActionCreator.onUpdateExtended(!state.personalExtend));
              },
            ),
          ),
        ),
      ],
    ),
  ));
}
