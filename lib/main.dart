import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action,Page;
import 'package:flutter_married/page/login/page.dart';
import 'package:flutter_married/page/register/page.dart';
import 'package:flutter_married/page/splash/page.dart';

import 'page/improve_information/page.dart';

void main() => runApp(createApp());

Widget createApp() {
  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      'splash_page':SplashPage(),
      'login_page':LoginPage(),
      'register_page':RegisterPage(),
      'improve_info_page':ImproveInformationPage(),
    },
  );

  return MaterialApp(
    title: 'GuYun',
    theme: ThemeData(
        primaryColor: Color(0xff545268)
    ),
    home: routes.buildPage('splash_page', null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}