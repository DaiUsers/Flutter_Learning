import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import 'xx_http_config.dart';
import 'xx_http_err.dart';

typedef void XXHttpSuccessCallback(dynamic data);

typedef void XXHttpFailureCallback(XXHttpError err);

class XXHttpUtil {

  factory XXHttpUtil() => _singleTon;

  static final XXHttpUtil _singleTon = XXHttpUtil._internal();

  XXHttpUtil._internal() {
    if (null == _dio) {
      BaseOptions options = defaultOptions();
      _dio = Dio(options);
      addInterceptors();
    }
  }

  Dio _dio;
  
  ///同一个CancelToken可以用于多个请求，
  ///当一个CancelToken取消时，所有使用该CancelToken的请求都会被取消，
  ///一个页面对应一个CancelToken。
  Map<String,CancelToken> _cancelTokenDic = Map<String,CancelToken>();

  final String _post = "POST";
  final String _get = "GET";

  BaseOptions defaultOptions() {
    return BaseOptions(
      baseUrl: XXHttpConfig.baseUrl,
      connectTimeout: XXHttpConfig.connectTimeout,
      receiveTimeout: XXHttpConfig.receiveTimeout,
    );
  }

  void addInterceptors() {
    var cacheConfig = CacheConfig(baseUrl: XXHttpConfig.baseUrl,);
    _dio.interceptors.add(DioCacheManager(cacheConfig).interceptor);
  }

  void get(String path, {data, Map<String, dynamic> params, String cancelTag, XXHttpSuccessCallback resolve, XXHttpFailureCallback reject}) async {
    _request(path, _get, data: data, params: params, cancelTag: cancelTag, resolve: resolve, reject: reject);
  }

  void post(String path, {data, Map<String, dynamic> params, String cancelTag, XXHttpSuccessCallback resolve, XXHttpFailureCallback reject}) async {
    _request(path, _post, data: data, params: params, cancelTag: cancelTag, resolve: resolve, reject: reject);
  }

  void _request(String path, String method, { data, Map<String, dynamic> params, String cancelTag, XXHttpSuccessCallback resolve, XXHttpFailureCallback reject }) async {
    // Options options = Options(method: method);
    Options options = buildCacheOptions(Duration(days: 7));
    options.method = method;
    CancelToken cancelToken;
    if (null != cancelTag && cancelTag.isNotEmpty) {
      _cancelTokenDic[cancelTag] ??= CancelToken();
      cancelToken = _cancelTokenDic[cancelTag];
    }
    try {
      var res = await _dio.request(path, data: data, options: options, queryParameters: params, cancelToken: cancelToken);
      
      if (res.statusCode == HttpStatus.ok) {
        resolve(res.data);
      }
    } on DioError catch(error) {
      print("dioErr: $error");
      if (null != reject) {
        reject(XXHttpError.dioError(error));
      }
    } catch(err) {
      print("error: $err");
      if (null != reject) {
        reject(XXHttpError(XXHttpError.UNKNOWN, "异常"));
      }
    }
  }
}