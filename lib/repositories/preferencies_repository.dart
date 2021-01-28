
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciesRepository {

  final String scoreKey = 'score';

  Future<void> saveScore(int score) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(scoreKey, score);

  }

  Future<int> loadScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(scoreKey) ?? 0;
  }

}