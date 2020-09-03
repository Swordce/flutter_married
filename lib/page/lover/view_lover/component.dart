import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ViewLoverComponent extends Component<ViewLoverState> {
  ViewLoverComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ViewLoverState>(
                adapter: null,
                slots: <String, Dependent<ViewLoverState>>{
                }),);

}
