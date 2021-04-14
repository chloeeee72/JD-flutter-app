import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Home.dart';
import 'Category.dart';
import 'Cart.dart';
import 'User.dart';

class Tabs extends StatefulWidget {
  Map arguments;
  Tabs({Key key,this.arguments}) : super(key: key);

  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  int _currentIndex=0;
  PageController _pageController;
  @override
  void initState() { 
    super.initState();
    this._pageController=new PageController(initialPage:this._currentIndex );
  }

  List<Widget> _pageList=[
    HomePage(),
    CategoryPage(),
    CartPage(),
    UserPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.h,
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text("jdshop"),
        ),
        body: PageView(
          controller: this._pageController,
          children: this._pageList,
          // onPageChanged: (){
          //
          // },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex:this._currentIndex ,
          onTap: (index){
              setState(() {
                 this._currentIndex=index;
                 this._pageController.jumpToPage(index);
              });
          },
          type:BottomNavigationBarType.fixed ,
          fixedColor:Colors.red,
          items: [
             BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label:"首页"           
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label:"分类"             
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
               label:"购物车"            
            ),            
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label:"我的"
            )
          ],
        ),     
        
      );
  }
}