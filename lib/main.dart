import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action,Page;
import 'package:flutter_married/page/account_safe/page.dart';
import 'package:flutter_married/page/account_setting/page.dart';
import 'package:flutter_married/page/country_code/page.dart';
import 'package:flutter_married/page/discussion/page.dart';
import 'package:flutter_married/page/discussion_detail/page.dart';
import 'package:flutter_married/page/edit_phone/page.dart';
import 'package:flutter_married/page/edit_pwd/page.dart';
import 'package:flutter_married/page/find_person/page.dart';
import 'package:flutter_married/page/find_result/page.dart';
import 'package:flutter_married/page/home/page.dart';
import 'package:flutter_married/page/login/page.dart';
import 'package:flutter_married/page/lover/page.dart';
import 'package:flutter_married/page/main/page.dart';
import 'package:flutter_married/page/register/page.dart';
import 'package:flutter_married/page/sign/page.dart';
import 'package:flutter_married/page/splash/page.dart';
import 'package:flutter_married/page/user/page.dart';
import 'package:flutter_married/page/user_info/page.dart';
import 'package:flutter_married/page/vip/page.dart';
import 'package:flutter_married/page/vistor/page.dart';
import 'package:flutter_married/utils/sp_util.dart';

import 'net/api.dart';
import 'page/improve_information/page.dart';
import 'utils/http/http_manager.dart';
import 'utils/http/lcfarm_log_interceptor.dart';
import 'utils/log_util.dart';

void main() {
  runApp(createApp(),);
  SpUtil().init();
  LogUtil.init(isDebug: true);
  HttpManager().init(
    baseUrl: Api.baseUrl,
    interceptors: [
      LcfarmLogInterceptor(),
    ],
  );
}

Widget createApp() {
  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      'splash_page':SplashPage(),
      'login_page':LoginPage(),
      'register_page':RegisterPage(),
      'countrycode_page':CountryCodePage(),
      'improve_info_page':ImproveInformationPage(),
      'vistor_page':VistorPage(),
      'home_page':HomePage(),
      'find_page':FindPersonPage(),
      'discussion_page':DiscussionPage(),
      'user_page':UserPage(),
      'main_page':MainPage(),
      'find_result':FindResultPage(),
      'user_info':UserInfoPage(),
      'discussion_detail':DiscussionDetailPage(),
      'lover':LoverPage(),
      'open_vip':OpenVipPage(),
      'account_setting':AccountSettingPage(),
      'account_safe':AccountSafePage(),
      'edit_phone':EditPhonePage(),
      'edit_password':EditPasswordPage(),
      'sign_in':SignPage(),
    },
  );

  return MaterialApp(
    title: '真爱良缘',
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