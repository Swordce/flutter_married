import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(CountryCodeState state, Dispatch dispatch, ViewService viewService) {
  return SafeArea(
    child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text('国际区号',style: TextStyle(fontSize: 18,color: Color(0xff333333)),),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,size: 18,color: Color(0xff333333),),onPressed: (){
          Navigator.of(viewService.context).pop();
        },),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: Container(
                height: 50,
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 15,right: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text('${state.codes[index].cn}',style: TextStyle(fontSize: 15,color: Color(0xff333333)),),
                    ),
                    Visibility(
                      visible: state.codes[index].phoneCode == state.defaultCode,
                      child: Image.asset('assets/icon_select.png'),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pop(viewService.context,state.codes[index]);
              },
            );
          },
          separatorBuilder: (context, index) {
            return Container(
              color: Color(0xffffffff),
              height: 0.5,
            );
          },
          itemCount: state.codes.length),
    ),
  );
}
