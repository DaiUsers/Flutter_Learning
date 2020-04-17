import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import './http/xx_http_config.dart';
import './http/xx_http_err.dart';
import './http/xx_http_util.dart';

/// 对网络层做一些处理 添加固定参数 打印请求、返回数据 特定异常处理
/// 单例shared
/// 方法post
/// 
/// 返回Completer.future
class XXNetwork {

  factory XXNetwork() => shared;

  static final XXNetwork shared = XXNetwork._internal();

  XXNetwork._internal();

  Future post({String path, bool loginForce=false, Map<String, dynamic>params, String tag}) async {
    
    path ??= XXHttpConfig.urlPath;
    params ??= Map<String, dynamic>();
    
    Completer completer = Completer();

    String token, memberId;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString("token") ?? "";
      memberId = prefs.getString("member_id") ?? "";
    } catch(e) {
      completer.completeError(XXHttpError(XXHttpError.UNKNOWN, "NETWORK_SharedPreferences"));
      return completer.future;
    }

    /// 强制登录
    if (loginForce && (token.isEmpty||null==token)) {
      completer.completeError("未登录");
      return completer.future;
    }
    
    params['member_id'] = memberId;
    params['token'] = token;
    params['platform'] = XXHttpConfig.getPlatform();
    params['version'] = XXHttpConfig.version;

    print(path);
    print(params);

    XXHttpUtil().post(path, params: params, resolve: (res) {
      
      if (XXHttpConfig.debug) {
        print(res);
      }

      if (res['code'] == 0) {
        completer.complete(res['data']);
      } else {
        String msg = res["data"]['scalar'] ?? res['msg'] ?? "数据异常!";
        completer.completeError(XXHttpError(XXHttpError.UNKNOWN, msg));
      }
    }, reject: (XXHttpError err) {
      completer.completeError(err);
    }, cancelTag: tag);

    return completer.future;
    
  }
}