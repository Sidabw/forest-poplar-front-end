import 'package:flutter/material.dart';
import 'gp-regist.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0), //空位符
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/sidabw.png',
                  height: 58.0,
                  width: 58.0,),
                SizedBox(height: 16.0),
                Text('SIDABW', style: TextStyle(fontSize: 14.0,),),
              ],
            ),
            SizedBox(height: 120.0),
            Column(
              children: <Widget>[
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    filled: true,//filled 指该文本框的背景将被一个浅色填充，以助于用户分辨出点击或触摸区域
                    labelText: 'Username',
                  ),
                ),
                SizedBox(height: 12.0,),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Password'
                  ),
                  obscureText: true,
                )
              ],
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('注册'),
                  onPressed: (){
                    _usernameController.clear();
                    _passwordController.clear();
                    Navigator.of(context).push(
                      new MaterialPageRoute<void>( // 路由新页面
                        builder: (BuildContext context) {
                          return new RegistPage();
                        },
                      ),
                    );
                  },
                ),
                RaisedButton(
                  child: Text('登录'),
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
