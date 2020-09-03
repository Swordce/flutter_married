import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_married/page/lover/my_lover/component.dart';
import 'package:flutter_married/page/lover/my_lover/state.dart';
import 'package:flutter_married/page/lover/tab_component/component.dart';
import 'package:flutter_married/page/lover/tab_component/state.dart';
import 'package:flutter_married/page/lover/view_lover/component.dart';
import 'package:flutter_married/page/lover/view_lover/state.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class LoverPage extends Page<LoverState, Map<String, dynamic>> {
  LoverPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<LoverState>(
                adapter: null,
                slots: <String, Dependent<LoverState>>{
                  'tab': TabConnector() + TabComponent(),
                  'myLover': MyLoverConnector() + MyLoverComponent(),
                  'viewLover': ViewLoverConnector() + ViewLoverComponent(),
                }),
            middleware: <Middleware<LoverState>>[
            ],);

}
