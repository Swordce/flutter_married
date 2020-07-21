import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class DiscussionPage extends Page<DiscussionState, Map<String, dynamic>> {
  DiscussionPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<DiscussionState>(
                adapter: null,
                slots: <String, Dependent<DiscussionState>>{
                }),
            middleware: <Middleware<DiscussionState>>[
            ],);

}
