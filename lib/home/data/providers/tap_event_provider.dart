import 'package:shared_preferences/shared_preferences.dart';

class TapEventProvider{
  Future<int> getSuccessCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('successCount') ?? 0;
  }
  Future<void> setSuccessCount(int successCount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('successCount', successCount);
  }
}