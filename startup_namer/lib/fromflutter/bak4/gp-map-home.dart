//手机验证码注册验证页面
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:math';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'gp-regist-detail.dart';


class MaphomePage extends StatefulWidget {
  @override
  _MaphomePageState2 createState() => _MaphomePageState2();
}

class _MaphomePageState2 extends State<MaphomePage> {

  @override
  Widget build(BuildContext context) {

//    return Scaffold(
//      body: SafeArea(
//        child: ListView(
//          padding: EdgeInsets.symmetric(horizontal: 24.0),
//          children: <Widget>[
//            SizedBox(height: 18.0), //空位符
//            SizedBox(height: 120.0),
//            Expanded(child: AndroidView(viewType: 'MyMap'),)
//          ],
//        ),
//      ),
//    );

    return MaterialApp(
      title: 'aaaa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('百度地图'),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: AndroidView(viewType: 'MyMap'),)
          ],
        ),
      ),
    );
  }

}
