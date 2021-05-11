import 'package:flutter/material.dart';
import '../services/ScreenAdapter.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.center_focus_weak,
        //     size: 28,
        //     color: Colors.black87,
        //   ),
        //   onPressed: () {},
        // ),
        title: Container(
          width: double.infinity,
          height: ScreenAdapter.height(72),
          decoration: BoxDecoration(
            color: Color.fromRGBO(233, 233, 233, 0.9),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    autofocus: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        size: 28,
                      ),
                      prefixIconConstraints: BoxConstraints(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: ScreenAdapter.width(10)),
            child: InkWell(
              onTap: () {
                print('---搜索单击了...----');
              },
              child: Center(
                child: Text("搜索"),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(ScreenAdapter.width(10)),
        child: ListView(
          children: [
            SizedBox(
              height: ScreenAdapter.height(10),
            ),
            Container(
              child: Text(
                "热搜",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Divider(),
            SizedBox(
              height: ScreenAdapter.height(10),
            ),
            Wrap(
              spacing: ScreenAdapter.width(20),
              runSpacing: ScreenAdapter.height(20),
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(20),
                      ScreenAdapter.height(10),
                      ScreenAdapter.width(20),
                      ScreenAdapter.height(10)),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 233, 233, 0.9),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text("超"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(20),
                      ScreenAdapter.height(10),
                      ScreenAdapter.width(20),
                      ScreenAdapter.height(10)),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 233, 233, 0.9),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text("超级"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(20),
                      ScreenAdapter.height(10),
                      ScreenAdapter.width(20),
                      ScreenAdapter.height(10)),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 233, 233, 0.9),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text("超级秒"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(20),
                      ScreenAdapter.height(10),
                      ScreenAdapter.width(20),
                      ScreenAdapter.height(10)),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 233, 233, 0.9),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text("超级秒杀"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(20),
                      ScreenAdapter.height(10),
                      ScreenAdapter.width(20),
                      ScreenAdapter.height(10)),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 233, 233, 0.9),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text("超级秒杀"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(20),
                      ScreenAdapter.height(10),
                      ScreenAdapter.width(20),
                      ScreenAdapter.height(10)),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 233, 233, 0.9),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text("超级秒杀"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(20),
                      ScreenAdapter.height(10),
                      ScreenAdapter.width(20),
                      ScreenAdapter.height(10)),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 233, 233, 0.9),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text("超级秒杀"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(20),
                      ScreenAdapter.height(10),
                      ScreenAdapter.width(20),
                      ScreenAdapter.height(10)),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 233, 233, 0.9),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text("超级秒杀"),
                ),
              ],
            ),
            SizedBox(
              height: ScreenAdapter.height(20),
            ),
            Container(
              child: Text(
                "历史搜索",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Divider(),
            SizedBox(
              height: ScreenAdapter.height(10),
            ),
            Column(
              children: [
                ListTile(
                  title: Text("女装"),
                ),
                Divider(),
                ListTile(
                  title: Text("女装"),
                ),
                Divider(),
                ListTile(
                  title: Text("女装"),
                ),
                Divider(),
                ListTile(
                  title: Text("女装"),
                ),
                Divider(),
                ListTile(
                  title: Text("女装"),
                ),
                Divider(),
                ListTile(
                  title: Text("女装"),
                ),
                Divider(),
                ListTile(
                  title: Text("女装"),
                ),
                Divider(),
                ListTile(
                  title: Text("女装"),
                ),
                Divider(),
                ListTile(
                  title: Text("女装"),
                ),
                Divider(),
                SizedBox(
                  height: ScreenAdapter.height(50),
                ),
                InkWell(
                  onTap: () {
                    print("---search---");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black45, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: ScreenAdapter.width(400),
                    height: ScreenAdapter.height(64),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delete),
                        Text("清空历史搜索"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenAdapter.height(100),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
