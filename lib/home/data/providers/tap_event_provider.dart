import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:successtap/home/model/tapEventResponse.dart';

class TapEventProvider {
  Future<TapEventResponse> handleTapEvent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool randomNumMatch = false;
    int randomNo = Random().nextInt(60);
    int currentSeconds = DateTime.now().second;
    int successCount = prefs.getInt('successCount') ?? 0;
    if (randomNo == currentSeconds) {
      successCount++;
      randomNumMatch = true;
      await prefs.setInt('successCount', successCount);
    }
    return TapEventResponse(successCount: successCount, randomNum: randomNo, isSuccessMatch: randomNumMatch);
  }

}
