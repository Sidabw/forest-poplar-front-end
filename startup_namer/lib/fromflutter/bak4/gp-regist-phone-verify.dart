//
////手机验证码注册页面
//
//import 'package:flutter/material.dart';
//import 'package:dio/dio.dart';
//import 'dart:math';
//import 'package:pin_input_text_field/pin_input_text_field.dart';
//
//
//class RegistVerifyPage extends StatefulWidget {
//  @override
//  _RegistPageVerifyState createState() => _RegistPageVerifyState();
//}
//
//class _RegistPageVerifyState extends State<RegistVerifyPage> {
////  final _aa = PinEditingController(pinLength:4);
//  final _phone_num1 = TextEditingController();
//  final _phone_num2 = TextEditingController();
//  final _phone_num3 = TextEditingController();
//  final _phone_num4 = TextEditingController();
//  TextField a;
//  TextField af;
//  TextField at;
//  TextField b;
//  TextField bf;
//  TextField bt;
//
//  @override
//  void initState() {
//    a = TextField(textAlign: TextAlign.center,
//      keyboardType:TextInputType.number,
//      controller: _phone_num1,
//      maxLength: 1,
//      autofocus: true,
//      onChanged: (String str){
//        print(str);
//        a = af;
//        b = bt;
//        setState(() {});
//      },);
//    af = TextField(textAlign: TextAlign.center,
////      keyboardType:TextInputType.number,
//      controller: _phone_num1,
//      autofocus: false,);
//    at = TextField(textAlign: TextAlign.center,
//      keyboardType:TextInputType.number,
//      controller: _phone_num1,
//      autofocus: true,);
//
//    b = TextField(textAlign: TextAlign.center,
//      keyboardType:TextInputType.number,
//      controller: _phone_num2,
//      autofocus: false,);
//    bf = TextField(textAlign: TextAlign.center,
//      keyboardType:TextInputType.number,
//      controller: _phone_num2,
//      autofocus: false,);
//    bt = TextField(textAlign: TextAlign.center,
//      keyboardType:TextInputType.number,
//      controller: _phone_num2,
//      autofocus: true,);
////  final List<TextField> aa = List<TextField>();
////    aa.add(a);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: SafeArea(
//        child: ListView(
//          padding: EdgeInsets.symmetric(horizontal: 24.0),
//          children: <Widget>[
//            SizedBox(height: 18.0), //空位符
//            Column(
//              children: <Widget>[
//                Image.asset(
//                  'assets/sidabw.png',
//                  height: 46.0,
//                  width: 46.0,),
//                SizedBox(height: 6.0),
//                Text('SIDABW', style: TextStyle(fontSize: 11.5,),),
//              ],
//            ),
//            Row(
//              children: <Widget>[
//                Expanded(
//                  child: a,
//                ),
//                SizedBox(width: 18.0,),
//                Expanded(
//                  child: b,
//                ),
//                SizedBox(width: 18.0,),
////                Expanded(
////                  child: TextField(
////                    textAlign: TextAlign.center,
////                    keyboardType:TextInputType.number,
////                    controller: _phone_num3,
////                  ),
////                ),
////                SizedBox(width: 18.0,),
////                Expanded(
////                  child: TextField(
////                    textAlign: TextAlign.center,
////                    keyboardType:TextInputType.number,
////                    controller: _phone_num4,
////                  ),
////                ),
//              ],
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  void getHttp() async {
//    try {
//      Response response = await Dio().get("http://10.0.2.2:8017/");
//      print(response);
//    } catch (e) {
//      print(e);
//    }
//  }
//}
