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

final sortProvider = StateProvider<String>((ref) => 'default');
final songDataProvider = StateProvider<List>((ref) => []);

final futureSongDataProvider = FutureProvider(
    (ref) async => await IsarService().getPjScores(ref.read(sortProvider)));

final streamSongDataProvider = StreamProvider((ref) async* {
  yield await IsarService().getPjScores(ref.read(sortProvider));
});
