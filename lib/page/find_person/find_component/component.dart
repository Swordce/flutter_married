import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class FindComponent extends Component<FindState> {
  FindComponent()
      : super(
          shouldUpdate: (oldState, newState) {
            return oldState.findExtend != newState.findExtend ||
                oldState.updateFind != newState.updateFind ||
                oldState.isUnlock != newState.isUnlock;
          },
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<FindState>(
              adapter: null, slots: <String, Dependent<FindState>>{}),
        );
}
