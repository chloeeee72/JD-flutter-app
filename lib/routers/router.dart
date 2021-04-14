import 'package:flutter/material.dart';
import 'package:flutter_jdshop/pages/ProductList.dart';
import 'package:flutter_jdshop/pages/Search.dart';
import 'package:flutter_jdshop/pages/tabs/Cart.dart';
import 'package:flutter_jdshop/pages/tabs/Category.dart';
import 'package:flutter_jdshop/pages/tabs/Home.dart';
import 'package:flutter_jdshop/pages/tabs/Tabs.dart';
import 'package:flutter_jdshop/pages/tabs/User.dart';

//配置路由
final routes = {
  '/tabs': (context) => Tabs(),
  '/search': (context) => SearchPage(),
  '/productList': (context,{arguments}) => ProductListPage(arguments:arguments),
  '/homePage': (context,{arguments}) => HomePage(arguments:arguments),
  '/cartPage': (context,{arguments}) => CartPage(arguments:arguments),
  '/userPage': (context,{arguments}) => UserPage(arguments:arguments),
  '/categoryPage': (context,{arguments}) => CategoryPage(arguments:arguments),
};

//固定写法
var onGenerateRoute = (RouteSettings settings) {
// 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
