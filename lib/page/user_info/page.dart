import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_married/page/find_person/personal_component/state.dart';
import 'package:flutter_married/page/user_info/info/component.dart';
import 'package:flutter_married/page/user_info/info/state.dart';
import 'package:flutter_married/page/user_info/personal_dynamic/component.dart';
import 'package:flutter_married/page/user_info/tab_component/component.dart';
import 'package:flutter_married/page/user_info/tab_component/state.dart';

import 'effect.dart';
import 'personal_dynamic/state.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class UserInfoPage extends Page<UserInfoState, Map<String, dynamic>> {
  UserInfoPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<UserInfoState>(
                adapter: null,
                slots: <String, Dependent<UserInfoState>>{
                  'tab': TabConnector() + TabComponent(),
                  'info':InfoConnector() + InfoComponent(),
                  'personal_dynamic':PersonalDynamicConnector() + PersonalDynamicComponent(),
                }),
            middleware: <Middleware<UserInfoState>>[
            ],);

}
