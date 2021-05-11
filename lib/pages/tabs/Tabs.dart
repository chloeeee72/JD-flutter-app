import 'package:flutter/material.dart';

import './Home.dart'; //首页
import './Category.dart'; //分类页面
import './User.dart';
import '../../services/ScreenAdapter.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  List<Widget> _pagesList = [HomePage(), CategoryPage(), UserPage()];

  var _pageController;

  @override
  void initState() {
    this._pageController = new PageController(initialPage: this._currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.center_focus_weak,
            size: 28,
            color: Colors.black87,
          ),
          onPressed: () {},
        ),
        title: Container(
          width: double.infinity,
          height: ScreenAdapter.height(72),
          decoration: BoxDecoration(
            color: Color.fromRGBO(233, 233, 233, 0.9),
            borderRadius: BorderRadius.circular(30),
          ),
          child: InkWell(
            child: Row(
              children: [
                SizedBox(width: ScreenAdapter.width(20)),
                Icon(
                  Icons.search,
                  size: 20,
                ),
                SizedBox(width: ScreenAdapter.width(10)),
                Text(
                  "笔记本",
                  style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(28),
                  ),
                ),
              ],
            ),
            onTap: (){
              print("--------clicked-------");
              //页面跳转 命名路由跳转
              Navigator.pushNamed(context, '/search');
            },
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: ScreenAdapter.width(10)),
            child: IconButton(
              icon: Icon(
                Icons.message,
                size: 28,
                color: Colors.black87,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      //body: this._pagesList[this._currentIndex], //页面切换
      body: IndexedStack(
        //tab切换保持页面状态
        children: this._pagesList,
        index: this._currentIndex,
      ),
      // body:PageView(
      //   controller: this._pageController,
      //   children:this._pagesList,
      //   onPageChanged: (index){
      //     print("----onPageChanged: index=${index}---");
      //   },
      // ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        currentIndex: this._currentIndex,
        onTap: (index) {
          print("----onTap: index=${index}---");
          setState(() {
            this._currentIndex = index;
            //this._pageController.jumpToPage(this._currentIndex);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("首页"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("分类"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("设置"),
          ),
        ],
      ),
    );
  }
}
