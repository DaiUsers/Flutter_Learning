import 'package:flutter/material.dart';

class TabHomePage extends StatefulWidget {
  TabHomePage({Key key}) : super(key: key);

  @override
  _TabHomePageState createState() => new _TabHomePageState();
}

class _TabHomePageState extends State<TabHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
       child: new RaisedButton(
         onPressed: btOnPress,
         child: new Text("click"),
       ),
      ),
    );
  }

  void btOnPress() {
    // Navigator.push 返回一個Future對象，用以接收 頁面返回數據 
    Navigator.of(context).pushNamed('/home_list_index').then((res){
      print(res);
    });
  }
}