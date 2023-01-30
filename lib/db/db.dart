import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:project_score/constant.dart';
import 'package:project_score/db/pj_songs.dart';
import 'package:project_score/model/load_json.dart';

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

  Future<void> updateMaster(Map scoreInfo) async {
    final isar = await db;
    List result =
        await isar.pj_songs.filter().nameContains(scoreInfo["name"]).findAll();
    print(result[0].name);
    final masterInfo = pj_diff_and_score()
      ..bestPerfect = scoreInfo["perfect"]
      ..bestGreat = scoreInfo["great"];
    pj_song songInfo = pj_song()
      ..id = result[0].id
      ..name = result[0].name
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
