import 'package:flutter/material.dart';


class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => new _ListPageState();
}

class _ListPageState extends State<ListPage> {

  @override
  void initState() { 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("List Page"),
      ),
      body:  new Center(
        child: new Container(
          child: new RaisedButton(
            onPressed: popFunc,
            child: new Text("click"),
          ),
        ),
      ),
    );
  }

  void popFunc() {
    //Navigator.pop, 后可接回調參數
    Navigator.pop(context, "123");
  }
}