import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DialogUtils {

  static void showBottomSheetDialog(BuildContext cx, List<String> datas) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: cx,
        builder: (builder) {
          return new Container(
              height: 300,
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(25.0),
                      topRight: const Radius.circular(25.0))),
              child: Container(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Container();
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        color: Color(0xffeeeeee),
                        height: 0.5,
                      );
                    },
                    itemCount: datas.length),
              ));
        });
  }
}
