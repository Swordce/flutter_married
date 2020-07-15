import 'package:fish_redux/fish_redux.dart';

class SplashState implements Cloneable<SplashState> {
  bool isVistor = false;

  @override
  SplashState clone() {
    return SplashState()..isVistor = isVistor;
  }
}

SplashState initState(Map<String, dynamic> args) {
  return SplashState();
}
