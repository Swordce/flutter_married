import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PersonalDynamicComponent extends Component<PersonalDynamicState> {
  PersonalDynamicComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PersonalDynamicState>(
                adapter: null,
                slots: <String, Dependent<PersonalDynamicState>>{
                }),);

}
