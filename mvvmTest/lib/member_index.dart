
import 'package:mvvmTest/utils/xx_net/xx_network.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mvvmTest/models/member_index.dart';

class MemberIndexTest {
  final String methodName = "MemberIndex";
  final String memberId = "41";
  final String version = "1.0";
  final String token = "674753ca73997aba284039e3419d337d";
  final String platform = "1";

  void shared() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", token);
      await prefs.setString('member_id', memberId);
      print('seting');
    } catch (e) {
      print('setinge: $e');
    }
    
  }

  void request() async {
    XXNetwork.shared
      .post(params: {'methodName':methodName})
      .then((value) => MemberIndex.fromJson(value))
      .then((data) {
        print(data.memberOrder.startTime);
    }).catchError((err) {
      print("catchError: $err");
    }).whenComplete(() {
      print("over");
    });
  }
}