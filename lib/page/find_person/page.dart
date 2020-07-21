import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_married/page/find_person/find_component/component.dart';
import 'package:flutter_married/page/find_person/find_component/state.dart';
import 'package:flutter_married/page/find_person/personal_component/component.dart';
import 'package:flutter_married/page/find_person/personal_component/state.dart';
import 'package:flutter_married/page/find_person/tab_component/component.dart';
import 'package:flutter_married/page/find_person/tab_component/state.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class FindPersonPage extends Page<FindPersonState, Map<String, dynamic>> {
  FindPersonPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<FindPersonState>(
              adapter: null,
              slots: <String, Dependent<FindPersonState>>{
                'tab': TabConnector() + TabComponent(),
                'personal': PersonalConnector() + PersonalComponent(),
                'find': FindConnector() + FindComponent(),
              }),
          middleware: <Middleware<FindPersonState>>[],
        );
}
