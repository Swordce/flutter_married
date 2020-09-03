import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MyLoverComponent extends Component<MyLoverState> {
  MyLoverComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MyLoverState>(
                adapter: null,
                slots: <String, Dependent<MyLoverState>>{
                }),);

}
