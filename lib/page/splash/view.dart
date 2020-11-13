import 'package:animated_widgets/animated_widgets.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_married/page/discussion/page.dart';
import 'package:flutter_married/page/find_person/page.dart';
import 'package:flutter_married/page/home/page.dart';
import 'package:flutter_married/page/user/page.dart';
import 'package:flutter_married/utils/http/http_manager.dart';
import 'package:flutter_married/utils/sp_util.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SplashState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: Stack(
      children: <Widget>[
        Image.asset(
          'assets/icon_splash_bg.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        OpacityAnimatedWidget.tween(
          child: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: ImageIcon(AssetImage('assets/icon_back.png')),
              color: Colors.white,
              onPressed: () {
                dispatch(SplashActionCreator.onIsVistor(false));
              },
            ),
          ),
          opacityEnabled: 1,
          opacityDisabled: 0,
          enabled: state.isVistor,
          duration: Duration(milliseconds: 300),
        ),
        OpacityAnimatedWidget.tween(
          child: Container(
            margin: EdgeInsets.only(left: 68.5, right: 68.5, bottom: 55),
            alignment: Alignment.center,
            child: Image.asset(
              'assets/icon_splash_logo.png',
              fit: BoxFit.fill,
            ),
          ),
          opacityEnabled: 1,
          opacityDisabled: 0,
          enabled: !state.isVistor,
          duration: Duration(milliseconds: 300),
        ),
        TranslationAnimatedWidget.tween(
          enabled: state.isVistor,
          duration: Duration(milliseconds: 300),
          translationDisabled: Offset(0, 200),
          translationEnabled: Offset(0, 0),
          child: OpacityAnimatedWidget.tween(
            enabled: state.isVistor,
            opacityDisabled: 0,
            opacityEnabled: 1,
            duration: Duration(milliseconds: 300),
            child: Container(
              margin: EdgeInsets.only(top: 177.5),
              child: Column(
                children: <Widget>[
                  Text(
                    '请选择您的性别',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          width: 105,
                          height: 143,
                          child: Image.asset('assets/icon_splash_male.png'),
                        ),
                        onTap: () {
                          Navigator.of(viewService.context)
                              .pushReplacementNamed('vistor_page',
                                  arguments: {'isMale': true});
                        },
                      ),
                      SizedBox(
                        width: 46.5,
                      ),
                      GestureDetector(
                        child: Container(
                          width: 105,
                          height: 143,
                          child: Image.asset('assets/icon_splash_female.png'),
                        ),
                        onTap: () {
                          Navigator.of(viewService.context)
                              .pushReplacementNamed('vistor_page',
                                  arguments: {'isMale': false});
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        TranslationAnimatedWidget(
          enabled: !state.isVistor,
          duration: Duration(milliseconds: 300),
          values: [
            Offset(0, 200), // disabled value value
            Offset(0, 250), //intermediate value
            Offset(0, 0) //enabled value
          ],
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 37),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: Image.asset(
                    'assets/icon_splash_login.png',
                    fit: BoxFit.fill,
                  ),
                  onTap: () {
//                    Navigator.of(viewService.context).pop();
                    String token = SpUtil().getString("token");
                    // String token = "";
                    HttpManager().client.options.headers = {'Authorization':token};
                    // println('token=$token');
                    if (token != null && token.isNotEmpty) {
                      Navigator.of(viewService.context)
                          .pushReplacementNamed('main_page', arguments: {
                        'pages': List<Widget>.unmodifiable([
                          HomePage().buildPage(null),
                          FindPersonPage().buildPage(null),
                          DiscussionPage().buildPage(null),
                          UserPage().buildPage(null),
                        ])
                      });
                    } else {
                      Navigator.of(viewService.context)
                          .pushReplacementNamed('login_page');
                    }
                  },
                ),
                SizedBox(
                  height: 18.5,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: Image.asset(
                    'assets/icon_splash_vistor.png',
                    fit: BoxFit.fill,
                  ),
                  onTap: () {
                    dispatch(SplashActionCreator.onIsVistor(true));
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
