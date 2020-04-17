import 'dart:io';

class XXHttpConfig {
  static final bool debug = true;
  static final String baseUrl = debug ? "https://jiazhen.t.jjys168.com/" : "https://jiazhen.jjys168.com/";
  static final String urlPath = "api_corper";
  static final int connectTimeout = 5000;
  static final int receiveTimeout = 3000;

  static const String version = '1.0';

  static String getPlatform() {
    
    if (Platform.isIOS) {
      return 'ios';
    } else if (Platform.isAndroid) {
      return 'android';
    }
    return 'unknown';
  }
}