//手机验证码注册验证页面
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:math';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'gp-regist-detail.dart';


class RegistVerifyPage2 extends StatefulWidget {
  @override
  _RegistPageVerifyState2 createState() => _RegistPageVerifyState2();
}

class _RegistPageVerifyState2 extends State<RegistVerifyPage2> {
  PinEditingController pinEditingController = PinEditingController(pinLength: 4, autoDispose: false);

  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        // TextField has lost focus
        print(1111);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 18.0), //空位符
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/sidabw.png',
                  height: 46.0,
                  width: 46.0,),
                SizedBox(height: 6.0),
                Text('SIDABW', style: TextStyle(fontSize: 11.5,),),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: PinInputTextField(
                    pinEditingController: pinEditingController,
                    pinLength:4,
                    autoFocus:true,
                    focusNode: _focusNode,
                    decoration: UnderlineDecoration(
                      textStyle: TextStyle(color: Colors.green, fontSize: 19),
                    ),
                    onSubmit: (String str){
                      print(str);
                      Navigator.of(context).push(
                        new MaterialPageRoute<void>( // 路由新页面
                          builder: (BuildContext context) {
                            return new RegistDetailPage();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
