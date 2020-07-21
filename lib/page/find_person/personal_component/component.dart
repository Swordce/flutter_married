import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PersonalComponent extends Component<PersonalState> {
  PersonalComponent()
      : super(
          shouldUpdate: (oldState, newState) {
            return oldState.personalExtend != newState.personalExtend || oldState.updatePersonal != newState.updatePersonal;
          },
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<PersonalState>(
              adapter: null, slots: <String, Dependent<PersonalState>>{}),
        );
}
