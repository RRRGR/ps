import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_score/db/db.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPClass {
  void updateFontSize(String newFontSize) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('fontSize', newFontSize);
  }

  Future<String> readFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    String? fontSize = prefs.getString('fontSize');
    fontSize ??= "12";
    return fontSize;
  }
}

final sortProvider = StateProvider<String>((ref) => 'デフォルト');
final levelProvider = StateProvider<String>((ref) => 'Master');

final streamSongDataProvider = StreamProvider((ref) async* {
  yield await IsarService().getPjScores(ref.read(sortProvider));
});
