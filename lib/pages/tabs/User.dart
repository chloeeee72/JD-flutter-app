import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  Map arguments;
  UserPage({Key key ,this.arguments}) : super(key: key);

  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Text("我是用户组件");
  }
}