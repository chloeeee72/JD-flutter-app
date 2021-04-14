import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../model/ProductModel.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/Config.dart';
import 'package:dio/dio.dart';

//轮播图类模型
import '../../model/FocusModel.dart';

class HomePage extends StatefulWidget {
  Map arguments;
  HomePage({Key key,this.arguments}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{

  
  List _focusData = [];
  List _hotProductList = [];
  List _bestProductList = [];

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _getFocusData();
    _getHotProductData();
    _getBestProductData();
  }

  //获取轮播图数据
  _getFocusData() async {
    var api = '${Config.domain}api/focus';
    var result = await Dio().get(api);
    var focusList = FocusModel.fromJson(result.data);
    setState(() {
      this._focusData = focusList.result;
    });
  }

  //获取猜你喜欢的数据
  _getHotProductData() async {
    var api = '${Config.domain}api/plist?is_hot=1';
    var result = await Dio().get(api);
    var hotProductList = ProductModel.fromJson(result.data);
    setState(() {
      this._hotProductList = hotProductList.result;
    });
  }

  //获取热门推荐的数据
  _getBestProductData() async {
    var api = '${Config.domain}api/plist?is_best=1';
    var result = await Dio().get(api);
    var bestProductList = ProductModel.fromJson(result.data);    
    setState(() {
      this._bestProductList = bestProductList.result;
    });
  }

  //轮播图
  Widget _swiperWidget() {
    if (this._focusData.length > 0) {
      return Container(
        child: AspectRatio(
          aspectRatio: 2 / 1,
          child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                String pic = this._focusData[index].pic;
                pic = Config.domain + pic.replaceAll('\\', '/');
                return new Image.network(
                  "${pic}",
                  fit: BoxFit.fill,
                );
              },
              itemCount: this._focusData.length,
              pagination: new SwiperPagination(),
              autoplay: true),
        ),
      );
    } else {
      return Text('加载中...');
    }
  }

  Widget _titleWidget(value) {
    return Container(
      height: 40.h,
      margin: EdgeInsets.only(left: 20.w),
      padding: EdgeInsets.only(left: 20.w),
      decoration: BoxDecoration(
          border: Border(
              left: BorderSide(
        color: Colors.red,
        width:10.w,
      ))),
      child: Text(
        value,
        style: TextStyle(color: Colors.black54),
      ),
    );
  }
  //热门商品

  Widget _hotProductListWidget() {
    if (this._hotProductList.length > 0) {
      return GestureDetector(
        onTap: (){
          // Navigator.pushNamed(context, '/productList');
          print("tap home page like item");
        },
        child: Container(
          height: 234.h,
          padding: EdgeInsets.all(20.w),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (contxt, index) {
              //处理图片
              String sPic = this._hotProductList[index].sPic;
              sPic = Config.domain + sPic.replaceAll('\\', '/');

              return Column(
                children: <Widget>[
                  Container(
                    height: 140.h,
                    width: 140.w,
                    margin: EdgeInsets.only(right: 21.w),
                    child: Image.network(sPic, fit: BoxFit.cover),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.h),
                    height: 44.h,
                    child: Text(
                      "¥${this._hotProductList[index].price}",
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                ],
              );
            },
            itemCount: this._hotProductList.length,
          ),
        ),
      );
    } else {
      return Text("");
    }
  }

  //推荐商品
  Widget _recProductListWidget() {
    var itemWidth = (1.sw- 50.w) / 2;
    return GestureDetector(
      onTap: (){
        // Navigator.pushNamed(context, '/productList');
        print("tap home page recomment item");
      },
      child: Container(
        padding: EdgeInsets.all(10.w),
        child: Wrap(
          runSpacing: 10,
          spacing: 10,
          children: this._bestProductList.map((value) {

            //图片
            String sPic=value.sPic;
            sPic=Config.domain+sPic.replaceAll('\\', '/');

            return Container(
              padding: EdgeInsets.all(10.w),
              width: itemWidth,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromRGBO(233, 233, 233, 0.9), width: 1.w)),
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: AspectRatio(
                      //防止服务器返回的图片大小不一致导致高度不一致问题
                      aspectRatio: 1 / 1,
                      child: Image.network(
                        "${sPic}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Text(
                      "${value.title}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "¥${value.price}",
                            style: TextStyle(color: Colors.red,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text( "¥${value.oldPrice}",
                              style: TextStyle(
                                  color: Colors.black54,
                                  decoration: TextDecoration.lineThrough)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _swiperWidget(),
          SizedBox(height: 20.h),
          _titleWidget("猜你喜欢"),
          SizedBox(height: 20.h),
          _hotProductListWidget(),
          _titleWidget("热门推荐"),
          _recProductListWidget()
        ],
      ),
    );
  }


}
