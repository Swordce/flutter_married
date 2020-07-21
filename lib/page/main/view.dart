import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_married/widgets/keepalive_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {

  return Builder(
    builder: (context) {
      final pageController = PageController();

      Widget _buildPage(Widget page) {
        return KeepAliveWidget(page);
      }
      return WillPopScope(
        child: Scaffold(
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            children: state.pages.map(_buildPage).toList(),
            controller: pageController,
            onPageChanged: (int i) => dispatch(MainActionCreator.onChange(i)),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(state.selectedIndex == 0? 'assets/2.0x/icon_home_selected.png':'assets/2.0x/icon_home_unselected.png',width: 20.45,height: 17.28,),
                title: Text('首页',style: TextStyle(fontSize: 11,color: state.selectedIndex == 0?Color(0xffF92431) : Color(0xff999999)),),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(state.selectedIndex == 1? 'assets/2.0x/icon_find_selected.png':'assets/2.0x/icon_find_unselected.png',width: 20.22,height: 16.98,),
                title: Text('找对象',style: TextStyle(fontSize: 11,color: state.selectedIndex == 1?Color(0xffF92431) : Color(0xff999999)),),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(state.selectedIndex == 2? 'assets/2.0x/icon_discussion_selected.png':'assets/2.0x/icon_discussion_unselected.png',width: 18.18,height: 18.18,),
                title: Text('社区',style: TextStyle(fontSize: 11,color: state.selectedIndex == 2?Color(0xffF92431) : Color(0xff999999)),),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(state.selectedIndex == 3? 'assets/2.0x/icon_user_selected.png':'assets/2.0x/icon_user_unselected.png',width: 16.46,height: 17.33,),
                title: Text('我的',style: TextStyle(fontSize: 11,color: state.selectedIndex == 3?Color(0xffF92431) : Color(0xff999999)),),
              ),
            ],
            currentIndex: state.selectedIndex,
            onTap: (int index) {
              pageController.jumpToPage(index);
            },
            type: BottomNavigationBarType.fixed,
          ),
        ),
        onWillPop: () async {
          SystemNavigator.pop();
          return true;
        },
      );
    },
  );
}
