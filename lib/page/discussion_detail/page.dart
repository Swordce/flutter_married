import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class DiscussionDetailPage extends Page<DiscussionDetailState, Map<String, dynamic>> {
  DiscussionDetailPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<DiscussionDetailState>(
                adapter: null,
                slots: <String, Dependent<DiscussionDetailState>>{
                }),
            middleware: <Middleware<DiscussionDetailState>>[
            ],);

}
