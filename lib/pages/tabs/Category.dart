import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../services/ScreenAdaper.dart';
import '../../config/Config.dart';
import 'package:dio/dio.dart';
import '../../model/CateModel.dart';

class CategoryPage extends StatefulWidget {
  Map arguments;
  CategoryPage({Key key,this.arguments}) : super(key: key);

  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with AutomaticKeepAliveClientMixin {
  int _selectIndex = 0;
  List _leftCateList = [];
  List _rightCateList = [];

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _getLeftCateData();
    print("category");
  }

  //左侧分类
  _getLeftCateData() async {
    var api = '${Config.domain}api/pcate';
    var result = await Dio().get(api);
    var leftCateList = new CateModel.fromJson(result.data);
    // print(leftCateList.result);
    setState(() {
      this._leftCateList = leftCateList.result;
    });
    _getRightCateData(leftCateList.result[0].sId);
  }

  //右侧分类
  _getRightCateData(pid) async {
    var api = '${Config.domain}api/pcate?pid=${pid}';
    var result = await Dio().get(api);
    var rightCateList = new CateModel.fromJson(result.data);
    // print(rightCateList.result);
    setState(() {
      this._rightCateList = rightCateList.result;
    });
  }

  Widget _leftCateWidget(leftWidth) {
    if (this._leftCateList.length > 0) {
      return Container(
        width: leftWidth,
        height: double.infinity,
        // color: Colors.red,
        child: ListView.builder(
          itemCount: this._leftCateList.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectIndex = index;
                      this._getRightCateData(this._leftCateList[index].sId);
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 84.h,
                    padding: EdgeInsets.only(top: 24.h),
                    child: Text("${this._leftCateList[index].title}",
                        textAlign: TextAlign.center),
                    color: _selectIndex == index
                        ? Color.fromRGBO(240, 246, 246, 0.9)
                        : Colors.white,
                  ),
                ),
                Divider(height: 1.h),
              ],
            );
          },
        ),
      );
    } else {
      return Container(width: leftWidth, height: double.infinity);
    }
  }

  Widget _rightCateWidget(rightItemWidth, rightItemHeight) {
    if (this._rightCateList.length > 0) {
      return Expanded(
        flex: 1,
        child: Container(
            padding: EdgeInsets.all(10.w),
            height: double.infinity,
            color: Color.fromRGBO(240, 246, 246, 0.9),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: rightItemWidth / rightItemHeight,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: this._rightCateList.length,
              itemBuilder: (context, index) {
                //处理图片
                String pic = this._rightCateList[index].pic;
                pic = Config.domain + pic.replaceAll('\\', '/');

                return InkWell(
                  onTap: (){

                    Navigator.pushNamed(context, '/productList',arguments: {
                      "cid":this._rightCateList[index].sId
                    });
                    
                  },
                  child: Container(
                    // padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 1 / 1,
                          child: Image.network("${pic}", fit: BoxFit.cover),
                        ),
                        Container(
                          height: 28.h,
                          child: Text("${this._rightCateList[index].title}",style: TextStyle(fontSize: 24.sp),),
                        )
                      ],
                    ),
                  ),
                );
              },
            )),
      );
    } else {
      return Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(10.w),
            height: double.infinity,
            color: Color.fromRGBO(240, 246, 246, 0.9),
            child: Text("加载中..."),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    //左侧宽度
    var leftWidth = 1.sw / 4;
    //右侧每一项宽度=（总宽度-左侧宽度-GridView外侧元素左右的Padding值-GridView中间的间距）/3
    var rightItemWidth =
        (1.sw - leftWidth - 20.w - 20.w) / 3;
    //获取计算后的宽度
    rightItemWidth = rightItemWidth.w;
    //获取计算后的高度
    var rightItemHeight = rightItemWidth + 28.h;

    return Row(
      children: <Widget>[
        _leftCateWidget(leftWidth),
        _rightCateWidget(rightItemWidth, rightItemHeight)
      ],
    );
  }
}
