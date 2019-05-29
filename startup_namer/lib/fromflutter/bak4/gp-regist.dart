//手机验证码注册页面

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:math';

class RegistPage extends StatefulWidget {
  @override
  _RegistPageState createState() => _RegistPageState();
}

class _RegistPageState extends State<RegistPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final List<Image> aa = List<Image>();
  Image verifyimg =  Image.asset(
                            'assets/sidabw.png',
                             height: 46.0,
                             width: 46.0,);

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
            SizedBox(height: 120.0),
            Column(
              children: <Widget>[
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    filled: true,//filled 指该文本框的背景将被一个浅色填充，以助于用户分辨出点击或触摸区域
                    labelText: '手机号📱',
                  ),
                  keyboardType:TextInputType.number,  //数字键盘
                ),
                SizedBox(height: 12.0,),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      filled: true,//filled 指该文本框的背景将被一个浅色填充，以助于用户分辨出点击或触摸区域
                      labelText: '图形验证码',
                    ),
                    onTap: (){
                      var randomValue = Random().nextInt(100).toString();
                      verifyimg = Image.network("http://10.0.2.2:8017/gp/verify/getImg/" + randomValue,width: 135, height: 50,);
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(width: 18.0,),
                Expanded(
                  child: IconButton(
                      icon: verifyimg,
                      iconSize: 48,
                      onPressed: () {
                        //All network images are cached regardless of HTTP headers。所以就只能让你url每次都不一样喽...
                        var randomValue = Random().nextInt(100).toString();
                        verifyimg = Image.network("http://10.0.2.2:8017/gp/verify/getImg/" + randomValue,width: 135, height: 50,);
                        setState(() {});
                      }
                  ),
                )
              ],
            ),
            ButtonBar(
              alignment:MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('获取手机验证码'),
                  onPressed: (){

                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void getHttp() async {
    try {
      Response response = await Dio().get("http://10.0.2.2:8017/");
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
