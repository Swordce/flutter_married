import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';

class MainState implements Cloneable<MainState> {

  int selectedIndex = 0;
  List<Widget> pages;

  @override
  MainState clone() {
    return MainState()
      ..selectedIndex = selectedIndex
      ..pages = pages;
  }
}

MainState initState(Map<String, dynamic> args) {
//  println(args['pages']);
//  return MainState()..pages = args['pages'];
  return MainState();
}
