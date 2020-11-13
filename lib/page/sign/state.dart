import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_married/bean/sign_task.dart';

class SignState implements Cloneable<SignState> {
  Data signTask;
  List<String> iconSigns = [
    'assets/2.0x/icon_sign_one.png',
    'assets/2.0x/icon_sign_two.png',
    'assets/2.0x/icon_sign_three.png',
    'assets/2.0x/icon_sign_four.png',
    'assets/2.0x/icon_sign_five.png',
    'assets/2.0x/icon_sign_six.png',
    'assets/2.0x/icon_sign_seven.png'
  ];

  @override
  SignState clone() {
    return SignState()..signTask = signTask..iconSigns=iconSigns;
  }
}

SignState initState(Map<String, dynamic> args) {
  return SignState();
}
