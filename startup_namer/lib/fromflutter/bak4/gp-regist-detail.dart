//填写个人详细信息页面
//手机验证码注册页面

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:math';
import 'gp-regist-phone-verify.dart';
import 'gp-regist-phone-verify2.dart';

class RegistDetailPage extends StatefulWidget {
  @override
  _RegistPageDetailState createState() => _RegistPageDetailState();
}

class _RegistPageDetailState extends State<RegistDetailPage> {
  final _accountController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _usernameController= TextEditingController();
  final _groupcodeController= TextEditingController();

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
            SizedBox(height: 30.0),
            Column(
              children: <Widget>[
                TextField(
                  controller: _accountController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: '账号',
                  ),
                ),
                SizedBox(height: 12.0,),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: '密码',
                  ),
                ),
                SizedBox(height: 12.0,),
                TextField(
                  controller: _passwordConfirmController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: '确认密码',
                  ),
                ),
                SizedBox(height: 12.0,),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: '姓名',
                  ),
                ),
                SizedBox(height: 12.0,),
                TextField(
                  controller: _groupcodeController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: '团码',
                  ),
                  keyboardType:TextInputType.number,  //数字键盘
                ),
                SizedBox(height: 12.0,),
                ButtonBar(
                  alignment:MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('确认'),
                      onPressed: (){
//                    print(_phoneNumController.text);
//                    print(_ImgCodeController.text);
                        Navigator.of(context).push(
                          new MaterialPageRoute<void>( // 路由新页面
                            builder: (BuildContext context) {
                              return new RegistVerifyPage2();
                            },
                          ),
                        );
                      },
                    )
                  ],
                ),
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
