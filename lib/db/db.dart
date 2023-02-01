import 'package:isar/isar.dart';
import 'package:project_score/constant.dart';
import 'package:project_score/db/pj_songs.dart';
import 'package:project_score/model/load_json.dart';
import 'package:string_similarity/string_similarity.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Stream pjChanged() async* {
    final isar = await db;
    yield* isar.pj_songs.watchLazy();
  }

  Stream<List<pj_song>> pjListen(ref) async* {
    final sortSetting = ref.watch(sortProvider);
    final isar = await db;
    if (sortSetting == "") {
      yield* isar.pj_songs.where().watch();
    } else if (sortSetting == "曲名") {
      yield* isar.pj_songs.where().sortByName().watch();
    } else if (sortSetting == "レベル") {
      List<pj_song> sortByLevelList = [];
      for (int i = 40; i > 1; i--) {
        print(i);
        List<pj_song> newList = isar.pj_songs
            .filter()
            .master((q) => q.diffEqualTo(i))
            .findAllSync();
        sortByLevelList = [...sortByLevelList, ...newList];
        print(sortByLevelList.length);
      }
      // yield* isar.pj_songs.where().watch();
      yield sortByLevelList;
    }
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
    if (result.isEmpty) {
      List allSongInfo = isar.pj_songs.where().findAllSync();
      List<String> allSongName =
          List.generate(allSongInfo.length, (index) => allSongInfo[index].name);
      BestMatch bestMatch =
          StringSimilarity.findBestMatch(scoreData["name"], allSongName);
      print(bestMatch.bestMatch.target);
      scoreData["name"] = bestMatch.bestMatch.target;
      result = await isar.pj_songs
          .filter()
          .nameContains(scoreData["name"])
          .findAll();
    }
    final old_pj_songs = result[0];
    final masterInfo = pj_diff_and_score()
      ..diff = old_pj_songs.master.diff
      ..bestPerfect = scoreData["perfect"]
      ..bestGreat = scoreData["great"]
      ..bestGood = scoreData["good"]
      ..bestBad = scoreData["bad"]
      ..bestMiss = scoreData["miss"];
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
