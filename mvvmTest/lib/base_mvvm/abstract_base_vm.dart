import 'package:flutter/widgets.dart';
import 'dart:async';

abstract class BaseViewModel {
  bool _isFirst = true;

  bool get isFirst => _isFirst;

  @mustCallSuper
  void init(BuildContext context) {
    if (_isFirst) {
      _isFirst = false;
      doInit(context);
    }
  }

  /// 加载数据
  @protected
  Future loadData(BuildContext context);

  @protected
  void doInit(BuildContext context);

  void dispose();
}