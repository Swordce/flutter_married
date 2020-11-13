import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class EditPhonePage extends Page<EditPhoneState, Map<String, dynamic>> {
  EditPhonePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<EditPhoneState>(
                adapter: null,
                slots: <String, Dependent<EditPhoneState>>{
                }),
            middleware: <Middleware<EditPhoneState>>[
            ],);

}
