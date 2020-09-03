import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class FindResultPage extends Page<FindResultState, Map<String, dynamic>> {
  FindResultPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<FindResultState>(
                adapter: null,
                slots: <String, Dependent<FindResultState>>{
                }),
            middleware: <Middleware<FindResultState>>[
            ],);

}
