import 'package:flutter/material.dart';
import 'Home/index.dart';
import 'Article/index.dart';
import 'Mine/index.dart';

class MainTabPage extends StatefulWidget {
  MainTabPage({Key key}) : super(key: key);

  @override
  _MainTabPageState createState() => new _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {

  var currentPageIndex = 0;

  final List<Widget> tabItemPages = [
    new TabHomePage(),
    new TabArticlePage(),
    new TabMinePage()
  ];

  void tabBarDidOnTap(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: tabItemPages[currentPageIndex],
      bottomNavigationBar: new BottomNavigationBar(
        onTap: tabBarDidOnTap,
        currentIndex: currentPageIndex,
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home), title: new Text("首页")
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.archive), title: new Text("文章")
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.minimize), title: new Text("我的")
          )
        ],
      )
    );
  }
}