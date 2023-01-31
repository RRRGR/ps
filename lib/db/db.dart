import 'package:isar/isar.dart';
import 'package:project_score/db/pj_songs.dart';
import 'package:project_score/model/load_json.dart';
import 'package:string_similarity/string_similarity.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<void> updatePjSong() async {
    final isar = await db;
    print(isar);
    List songsList = await loadLocalJson();
    String songName = "";
    int eDiff = 0;
    int nDiff = 0;
    int hDiff = 0;
    int exDiff = 0;
    int mDiff = 0;
    for (Map songData in songsList) {
      songName = songData["name"];
      eDiff = songData["e_diff"];
      nDiff = songData["n_diff"];
      hDiff = songData["h_diff"];
      exDiff = songData["ex_diff"];
      mDiff = songData["m_diff"];
      List result =
          await isar.pj_songs.filter().nameContains(songName).findAll();
      final easyInfo = pj_diff_and_score()..diff = eDiff;
      final normalInfo = pj_diff_and_score()..diff = nDiff;
      final hardInfo = pj_diff_and_score()..diff = hDiff;
      final expertInfo = pj_diff_and_score()..diff = exDiff;
      final masterInfo = pj_diff_and_score()..diff = mDiff;
      pj_song songInfo;
      if (result.isEmpty) {
        songInfo = pj_song()
          ..name = songName
          ..easy = easyInfo
          ..normal = normalInfo
          ..hard = hardInfo
          ..expert = expertInfo
          ..master = masterInfo;
      } else {
        songInfo = pj_song()
          ..id = result[0].id
          ..name = songName
          ..easy = easyInfo
          ..normal = normalInfo
          ..hard = hardInfo
          ..expert = expertInfo
          ..master = masterInfo;
      }
      await isar.writeTxn(() async => await isar.pj_songs.put(songInfo));
    }
  }

  Future<void> updateMaster(Map scoreData) async {
    final isar = await db;
    List result =
        await isar.pj_songs.filter().nameContains(scoreData["name"]).findAll();
    print(result[0].name);
    if (result.isEmpty) {
      List allSongInfo = isar.pj_songs.where().findAllSync();
      List<String> allSongName =
          List.generate(allSongInfo.length, (index) => allSongInfo[index].name);
      var bestMatch =
          StringSimilarity.findBestMatch(scoreData["name"], allSongName);
      print(bestMatch);
      return;
    }
    final old_pj_songs = result[0];
    final masterInfo = pj_diff_and_score()
      ..bestPerfect = scoreData["perfect"]
      ..bestGreat = scoreData["great"];
    pj_song songInfo = pj_song()
      ..id = old_pj_songs.id
      ..name = old_pj_songs.name
      ..easy = old_pj_songs.easy
      ..normal = old_pj_songs.normal
      ..hard = old_pj_songs.hard
      ..expert = old_pj_songs.expert
      ..master = masterInfo;
    await isar.writeTxn(() async => await isar.pj_songs.put(songInfo));
  }

  Future<List> getPjMaster() async {
    final isar = await db;
    List result = await isar.pj_songs.where().findAll();
    return result;
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [Pj_songSchema],
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
