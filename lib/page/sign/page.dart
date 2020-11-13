import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SignPage extends Page<SignState, Map<String, dynamic>> {
  SignPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SignState>(
                adapter: null,
                slots: <String, Dependent<SignState>>{
                }),
            middleware: <Middleware<SignState>>[
            ],);

}
