import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class EditPasswordPage extends Page<EditPasswordState, Map<String, dynamic>> {
  EditPasswordPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<EditPasswordState>(
                adapter: null,
                slots: <String, Dependent<EditPasswordState>>{
                }),
            middleware: <Middleware<EditPasswordState>>[
            ],);

}
