import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _themes = <MaterialColor>[];

/// 存储一些全局变量
class Global {
  /// 个人缓存对象
  static SharedPreferences _prefs;

  static NetCache netCache = NetCache();

  static List<MaterialColor> get themes => _themes;

  static Future init() async {
   
  }

}

class NetCache {
  bool enable;
  int maxAge;
  int maxCount;
}