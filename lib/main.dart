import 'package:flutter/material.dart';

import './routers/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// 入口
void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 入口
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //屏幕适配
      designSize: Size(750, 1334),
      allowFontScaling: false,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        //根目录
        initialRoute: '/',
        onGenerateRoute: onGenerateRoute,
        //主题
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
      ),
    );
  }
}
