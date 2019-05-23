//手机验证码注册页面

import 'package:flutter/material.dart';

class RegistPage extends StatefulWidget {
  @override
  _RegistPageState createState() => _RegistPageState();
}

class _RegistPageState extends State<RegistPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

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
            ButtonBar(
              alignment:MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('获取手机验证码'),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
