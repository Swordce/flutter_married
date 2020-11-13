import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AccountSettingPage extends Page<AccountSettingState, Map<String, dynamic>> {
  AccountSettingPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AccountSettingState>(
                adapter: null,
                slots: <String, Dependent<AccountSettingState>>{
                }),
            middleware: <Middleware<AccountSettingState>>[
            ],);

}
