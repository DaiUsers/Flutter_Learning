import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'tab_bar.dart';
import 'Home/list/index.dart';
import 'Login/index/index.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => new _MyAppState();
}

// WidgetsBindingObserver 監聽  App 生命周期
class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MainTabPage(),
      routes: <String, WidgetBuilder>{
        // '/home_list_index': (BuildContext context) => new ListPage()
      }, // 路由聲明 Navigator.of(context).pushNamed('/home_list_index');
      onGenerateRoute: (RouteSettings settings) {
        // pushName方法  routes未聲明， 會調用 onGenerateRoute
        var routeName = settings.name;
        print("routeName:  =>   $routeName");
        if (true) {
          return new MaterialPageRoute(builder: (context) {
            return new ListPage();
          });
        } else {
          return new MaterialPageRoute(
              builder: (context) {
                return new LoginPage();
              },
              fullscreenDialog: false);
        }
      },
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    print(state);
    if (state == AppLifecycleState.paused) {
      // 應用被挂起
    } else if (state == AppLifecycleState.resumed) {
      // 應用進入前臺

      getClipboardData();
      print("hello clipboard");
    }
  }

  // 獲取粘貼板内容
  getClipboardData() {
    var data = Clipboard.getData(Clipboard.kTextPlain);
    if (data != null) {
      data.then((obj) {
        print("${obj.text}");
      });
    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void didChangeMetrics() {
    // TODO: implement didChangeMetrics
    super.didChangeMetrics();
    // 應用尺寸改變時回調 例如旋轉
  }

  @override
  void didHaveMemoryPressure() {
    // TODO: implement didHaveMemoryPressure
    super.didHaveMemoryPressure();
    // 低内存回調
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
}
