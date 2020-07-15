import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ImproveInformationPage extends Page<ImproveInformationState, Map<String, dynamic>> {
  ImproveInformationPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ImproveInformationState>(
                adapter: null,
                slots: <String, Dependent<ImproveInformationState>>{
                }),
            middleware: <Middleware<ImproveInformationState>>[
            ],);

}
