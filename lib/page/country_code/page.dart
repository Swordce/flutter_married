import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CountryCodePage extends Page<CountryCodeState, Map<String, dynamic>> {
  CountryCodePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CountryCodeState>(
                adapter: null,
                slots: <String, Dependent<CountryCodeState>>{
                }),
            middleware: <Middleware<CountryCodeState>>[
            ],);

}
