import 'package:city_pickers/city_pickers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_married/page/find_person/data/picker_data.dart';
import 'package:flutter_married/widgets/picker_tool.dart';

import '../action.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(FindState state, Dispatch dispatch, ViewService viewService) {
  void showPicker(int index) async {
    if (index < 1 || index > 2) {
      if (index == 6) {
        PickerTool.showArrayPicker(viewService.context,
            data: PickerData.generateIncome(), clickCallBack: (var i, var s) {
          dispatch(FindPersonActionCreator.onUpdateValue(
              index, '${s[0]} - ${s[1]}'));
        });
      } else {
        PickerTool.showStringPicker(viewService.context,
            data: PickerData.getMutiPickerData(index),
            clickCallBack: (int i, var s) {
          dispatch(FindPersonActionCreator.onUpdateValue(index, s));
        });
      }
    } else {
      Result result = await CityPickers.showCityPicker(
        context: viewService.context,
        showType: ShowType.pc,
        height: 205,
        cancelWidget: Text(
          '取消',
          style: TextStyle(color: Color(0xff333333), fontSize: 17),
        ),
        confirmWidget: Text(
          '确定',
          style: TextStyle(color: Color(0xff333333), fontSize: 17),
        ),
      );
      if (result != null) {
        dispatch(FindPersonActionCreator.onUpdateValue(
            index, '${result.provinceName} ${result.cityName}'));
      }
    }
  }

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
                        state.findConditions[index].key,
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff333333)),
                      ),
                      Expanded(child: Container()),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: index > 2 && !state.isUnlock
                            ? Image.asset(
                                'assets/2.0x/icon_lock.png',
                                width: 11.5,
                                height: 14,
                              )
                            : Text(
                                '',
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xff333333)),
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
                  showPicker(index);
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
            itemCount: state.findExtend ? state.findConditions.length : 7,
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
                    child: Text(
                      state.findExtend ? '收起' : '更多条件',
                      style: TextStyle(fontSize: 14, color: Color(0xffF92431)),
                    ),
                  ),
                  Image.asset(
                    state.findExtend
                        ? 'assets/2.0x/icon_circle_arrow_up.png'
                        : "assets/2.0x/icon_circle_arrow_down.png",
                    width: 16,
                    height: 16,
                  )
                ],
              ),
              behavior: HitTestBehavior.opaque,
              onTap: () {
                dispatch(FindPersonActionCreator.onUpdateExtended(
                    !state.findExtend));
              },
            ),
          ),
        ),
      ],
    ),
  ));
}
