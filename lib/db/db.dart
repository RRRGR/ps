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

  Stream<List<pj_song>> pjListen(String sortSetting) async* {
    final isar = await db;
    if (sortSetting == "default") {
      yield* isar.pj_songs.where().watch();
    } else if (sortSetting == "曲名") {
      yield* isar.pj_songs.where().sortByName().watch();
    } else if (sortSetting == "レベル") {
      List<pj_song> sortByLevelList = [];
      for (int i = 40; i > 1; i--) {
        List<pj_song> newList = isar.pj_songs
            .filter()
            .master((q) => q.diffEqualTo(i))
            .findAllSync();
        sortByLevelList = [...sortByLevelList, ...newList];
      }
      // yield* isar.pj_songs.where().watch();
      yield sortByLevelList;
    }
  }

  Stream<List<pj_song>> pjDefaultListen() async* {
    final isar = await db;
    print(1);
    yield* isar.pj_songs.where().watch();
  }

  Stream<List<pj_song>> pjNameListen() async* {
    final isar = await db;
    print(2);
    yield* isar.pj_songs.where().sortByName().watch();
  }

  Stream<List<pj_song>> pjLevelListen() async* {
    final isar = await db;
    List<pj_song> sortByLevelList = [];
    for (int i = 40; i > 1; i--) {
      List<pj_song> newList =
          isar.pj_songs.filter().master((q) => q.diffEqualTo(i)).findAllSync();
      sortByLevelList = [...sortByLevelList, ...newList];
    }
    // yield* isar.pj_songs.where().watch();
    yield sortByLevelList;
    yield* pjLevelListen();
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

  Future<void> updateScore(Map scoreData) async {
    final isar = await db;
    pj_song songInfo;
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
    if (scoreData['diff'] == 'Master') {
      final masterInfo = pj_diff_and_score()
        ..diff = old_pj_songs.master.diff
        ..bestPerfect = scoreData["perfect"]
        ..bestGreat = scoreData["great"]
        ..bestGood = scoreData["good"]
        ..bestBad = scoreData["bad"]
        ..bestMiss = scoreData["miss"];
      songInfo = pj_song()
        ..id = old_pj_songs.id
        ..name = old_pj_songs.name
        ..easy = old_pj_songs.easy
        ..normal = old_pj_songs.normal
        ..hard = old_pj_songs.hard
        ..expert = old_pj_songs.expert
        ..master = masterInfo;
    } else if (scoreData['diff'] == 'Expert') {
      final expertInfo = pj_diff_and_score()
        ..diff = old_pj_songs.expert.diff
        ..bestPerfect = scoreData["perfect"]
        ..bestGreat = scoreData["great"]
        ..bestGood = scoreData["good"]
        ..bestBad = scoreData["bad"]
        ..bestMiss = scoreData["miss"];
      songInfo = pj_song()
        ..id = old_pj_songs.id
        ..name = old_pj_songs.name
        ..easy = old_pj_songs.easy
        ..normal = old_pj_songs.normal
        ..hard = old_pj_songs.hard
        ..expert = expertInfo
        ..master = old_pj_songs.master;
    } else if (scoreData['diff'] == 'Hard') {
      final hardInfo = pj_diff_and_score()
        ..diff = old_pj_songs.hard.diff
        ..bestPerfect = scoreData["perfect"]
        ..bestGreat = scoreData["great"]
        ..bestGood = scoreData["good"]
        ..bestBad = scoreData["bad"]
        ..bestMiss = scoreData["miss"];
      songInfo = pj_song()
        ..id = old_pj_songs.id
        ..name = old_pj_songs.name
        ..easy = old_pj_songs.easy
        ..normal = old_pj_songs.normal
        ..hard = hardInfo
        ..expert = old_pj_songs.expert
        ..master = old_pj_songs.master;
    } else if (scoreData['diff'] == 'Normal') {
      final normalInfo = pj_diff_and_score()
        ..diff = old_pj_songs.normal.diff
        ..bestPerfect = scoreData["perfect"]
        ..bestGreat = scoreData["great"]
        ..bestGood = scoreData["good"]
        ..bestBad = scoreData["bad"]
        ..bestMiss = scoreData["miss"];
      songInfo = pj_song()
        ..id = old_pj_songs.id
        ..name = old_pj_songs.name
        ..easy = old_pj_songs.easy
        ..normal = normalInfo
        ..hard = old_pj_songs.hard
        ..expert = old_pj_songs.expert
        ..master = old_pj_songs.master;
    } else {
      final easyInfo = pj_diff_and_score()
        ..diff = old_pj_songs.easy.diff
        ..bestPerfect = scoreData["perfect"]
        ..bestGreat = scoreData["great"]
        ..bestGood = scoreData["good"]
        ..bestBad = scoreData["bad"]
        ..bestMiss = scoreData["miss"];
      songInfo = pj_song()
        ..id = old_pj_songs.id
        ..name = old_pj_songs.name
        ..easy = easyInfo
        ..normal = old_pj_songs.normal
        ..hard = old_pj_songs.hard
        ..expert = old_pj_songs.expert
        ..master = old_pj_songs.master;
    }
    await isar.writeTxn(() async => await isar.pj_songs.put(songInfo));
  }

  Future<void> updateFromForm(Map scoreMap) async {
    final isar = await db;
    pj_song songInfo;
    List result = await isar.pj_songs
        .filter()
        .nameContains(scoreMap['songName'])
        .findAll();
    // if (result.isEmpty) {
    //   List allSongInfo = isar.pj_songs.where().findAllSync();
    //   List<String> allSongName =
    //   List.generate(allSongInfo.length, (index) => allSongInfo[index].name);
    //   BestMatch bestMatch =
    //   StringSimilarity.findBestMatch(scoreData["name"], allSongName);
    //   print(bestMatch.bestMatch.target);
    //   scoreData["name"] = bestMatch.bestMatch.target;
    //   result = await isar.pj_songs
    //       .filter()
    //       .nameContains(scoreData["name"])
    //       .findAll();
    // }
    final old_pj_songs = result[0];
    if (scoreMap['diff'] == 'Master') {
      final masterInfo = pj_diff_and_score()
        ..diff = old_pj_songs.master.diff
        ..bestPerfect = scoreMap["perfect"]
        ..bestGreat = scoreMap["great"]
        ..bestGood = scoreMap["good"]
        ..bestBad = scoreMap["bad"]
        ..bestMiss = scoreMap["miss"];
      songInfo = pj_song()
        ..id = old_pj_songs.id
        ..name = old_pj_songs.name
        ..easy = old_pj_songs.easy
        ..normal = old_pj_songs.normal
        ..hard = old_pj_songs.hard
        ..expert = old_pj_songs.expert
        ..master = masterInfo;
    } else if (scoreMap['diff'] == 'Expert') {
      print(1);
      final expertInfo = pj_diff_and_score()
        ..diff = old_pj_songs.expert.diff
        ..bestPerfect = scoreMap["perfect"]
        ..bestGreat = scoreMap["great"]
        ..bestGood = scoreMap["good"]
        ..bestBad = scoreMap["bad"]
        ..bestMiss = scoreMap["miss"];
      songInfo = pj_song()
        ..id = old_pj_songs.id
        ..name = old_pj_songs.name
        ..easy = old_pj_songs.easy
        ..normal = old_pj_songs.normal
        ..hard = old_pj_songs.hard
        ..expert = expertInfo
        ..master = old_pj_songs.master;
    } else if (scoreMap['diff'] == 'Hard') {
      final hardInfo = pj_diff_and_score()
        ..diff = old_pj_songs.hard.diff
        ..bestPerfect = scoreMap["perfect"]
        ..bestGreat = scoreMap["great"]
        ..bestGood = scoreMap["good"]
        ..bestBad = scoreMap["bad"]
        ..bestMiss = scoreMap["miss"];
      songInfo = pj_song()
        ..id = old_pj_songs.id
        ..name = old_pj_songs.name
        ..easy = old_pj_songs.easy
        ..normal = old_pj_songs.normal
        ..hard = hardInfo
        ..expert = old_pj_songs.expert
        ..master = old_pj_songs.master;
    } else if (scoreMap['diff'] == 'Normal') {
      final normalInfo = pj_diff_and_score()
        ..diff = old_pj_songs.normal.diff
        ..bestPerfect = scoreMap["perfect"]
        ..bestGreat = scoreMap["great"]
        ..bestGood = scoreMap["good"]
        ..bestBad = scoreMap["bad"]
        ..bestMiss = scoreMap["miss"];
      songInfo = pj_song()
        ..id = old_pj_songs.id
        ..name = old_pj_songs.name
        ..easy = old_pj_songs.easy
        ..normal = normalInfo
        ..hard = old_pj_songs.hard
        ..expert = old_pj_songs.expert
        ..master = old_pj_songs.master;
    } else {
      final easyInfo = pj_diff_and_score()
        ..diff = old_pj_songs.easy.diff
        ..bestPerfect = scoreMap["perfect"]
        ..bestGreat = scoreMap["great"]
        ..bestGood = scoreMap["good"]
        ..bestBad = scoreMap["bad"]
        ..bestMiss = scoreMap["miss"];
      songInfo = pj_song()
        ..id = old_pj_songs.id
        ..name = old_pj_songs.name
        ..easy = easyInfo
        ..normal = old_pj_songs.normal
        ..hard = old_pj_songs.hard
        ..expert = old_pj_songs.expert
        ..master = old_pj_songs.master;
    }
    await isar.writeTxn(() async => await isar.pj_songs.put(songInfo));
  }

  Future<List> getPjMaster() async {
    final isar = await db;
    List result = await isar.pj_songs.where().findAll();
    return result;
  }

  Future<List> getPjScores(String sortSetting) async {
    final isar = await db;
    List result = [];
    if (sortSetting == "default") {
      result = await isar.pj_songs.where().findAll();
    } else if (sortSetting == "曲名") {
      result = await isar.pj_songs.where().sortByName().findAll();
    } else {
      for (int i = 40; i > 1; i--) {
        List<pj_song> newList = isar.pj_songs
            .filter()
            .master((q) => q.diffEqualTo(i))
            .findAllSync();
        result = [...result, ...newList];
      }
    }
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
