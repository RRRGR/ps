import 'dart:io';  //追加

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod/riverpod.dart';

part 'pj_songs_db.g.dart';

class PjSongs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get songName => text()();
  IntColumn get easyDiff => integer()();
  IntColumn get normalDiff => integer()();
  IntColumn get hardDiff => integer()();
  IntColumn get expertDiff =>integer()();
  IntColumn get masterDiff => integer()();
}

class PjEasyScores extends Table{
  IntColumn get id => integer().references(PjSongs, #id)();
  IntColumn get easyHighScore => integer().withDefault(const Constant(0))();
  IntColumn get easyBestExScore => integer().withDefault(const Constant(0))();
  IntColumn get easyBestPerfect => integer().withDefault(const Constant(0))();
  IntColumn get easyBestGreat => integer().withDefault(const Constant(0))();
  IntColumn get easyBestGood => integer().withDefault(const Constant(0))();
  IntColumn get easyBestBad => integer().withDefault(const Constant(0))();
  IntColumn get easyBestMiss => integer().withDefault(const Constant(0))();
  BoolColumn get easyFCed => boolean().withDefault(const Constant(false))();
  BoolColumn get easyAPed => boolean().withDefault(const Constant(false))();
}

class PjNormalScores extends Table{
  IntColumn get id => integer().references(PjSongs, #id)();
  IntColumn get normalHighScore => integer().withDefault(const Constant(0))();
  IntColumn get normalBestExScore => integer().withDefault(const Constant(0))();
  IntColumn get normalBestPerfect => integer().withDefault(const Constant(0))();
  IntColumn get normalBestGreat => integer().withDefault(const Constant(0))();
  IntColumn get normalBestGood => integer().withDefault(const Constant(0))();
  IntColumn get normalBestBad => integer().withDefault(const Constant(0))();
  IntColumn get normalBestMiss => integer().withDefault(const Constant(0))();
  BoolColumn get normalFCed => boolean().withDefault(const Constant(false))();
  BoolColumn get normalAPed => boolean().withDefault(const Constant(false))();
}

class PjHardScores extends Table{
  IntColumn get id => integer().references(PjSongs, #id)();
  IntColumn get hardHighScore => integer().withDefault(const Constant(0))();
  IntColumn get hardBestExScore => integer().withDefault(const Constant(0))();
  IntColumn get hardBestPerfect => integer().withDefault(const Constant(0))();
  IntColumn get hardBestGreat => integer().withDefault(const Constant(0))();
  IntColumn get hardBestGood => integer().withDefault(const Constant(0))();
  IntColumn get hardBestBad => integer().withDefault(const Constant(0))();
  IntColumn get hardBestMiss => integer().withDefault(const Constant(0))();
  BoolColumn get hardFCed => boolean().withDefault(const Constant(false))();
  BoolColumn get hardAPed => boolean().withDefault(const Constant(false))();
}

class PjExpertScores extends Table{
  IntColumn get id => integer().references(PjSongs, #id)();
  IntColumn get expertHighScore => integer().withDefault(const Constant(0))();
  IntColumn get expertBestExScore => integer().withDefault(const Constant(0))();
  IntColumn get expertBestPerfect => integer().withDefault(const Constant(0))();
  IntColumn get expertBestGreat => integer().withDefault(const Constant(0))();
  IntColumn get expertBestGood => integer().withDefault(const Constant(0))();
  IntColumn get expertBestBad => integer().withDefault(const Constant(0))();
  IntColumn get expertBestMiss => integer().withDefault(const Constant(0))();
  BoolColumn get expertFCed => boolean().withDefault(const Constant(false))();
  BoolColumn get expertAPed => boolean().withDefault(const Constant(false))();
}

class PjMasterScores extends Table{
  IntColumn get id => integer().references(PjSongs, #id)();
  IntColumn get masterHighScore => integer().withDefault(const Constant(0))();
  IntColumn get masterBestExScore => integer().withDefault(const Constant(0))();
  IntColumn get masterBestPerfect => integer().withDefault(const Constant(0))();
  IntColumn get masterBestGreat => integer().withDefault(const Constant(0))();
  IntColumn get masterBestGood => integer().withDefault(const Constant(0))();
  IntColumn get masterBestBad => integer().withDefault(const Constant(0))();
  IntColumn get masterBestMiss => integer().withDefault(const Constant(0))();
  BoolColumn get masterFCed => boolean().withDefault(const Constant(false))();
  BoolColumn get masterAPed => boolean().withDefault(const Constant(false))();
}

@DriftDatabase(tables: [PjSongs, PjEasyScores, PjNormalScores, PjHardScores, PjExpertScores, PjMasterScores])
class MyDatabase extends _$MyDatabase {
  MyDatabase(): super(_openConnection());
  @override
  int get schemaVersion => 1;

  Future<int> upsertSong(PjSongsCompanion song) {
    return into(pjSongs).insert(song,
        onConflict: DoUpdate(target: [pjSongs.songName],
        (old) => song),);
  }

  Future<int> upsertEasy(PjEasyScoresCompanion songData) {
    return into(pjEasyScores).insertOnConflictUpdate(songData);
  }

  Future<int> upsertNormal(PjNormalScoresCompanion songData) {
    return into(pjNormalScores).insertOnConflictUpdate(songData);
  }

  Future<int> upsertHard(PjHardScoresCompanion songData) {
    return into(pjHardScores).insertOnConflictUpdate(songData);
  }

  Future<int> upsertExpert(PjExpertScoresCompanion songData) {
    return into(pjExpertScores).insertOnConflictUpdate(songData);
  }

  Future<int> upsertMaster(PjMasterScoresCompanion songData) {
    return into(pjMasterScores).insertOnConflictUpdate(songData);
  }

  Future<List<PjSong>> get getAllSongs => select(pjSongs).get();

  Future songWithMaster() async {
    final query = await select(pjSongs).join([leftOuterJoin(pjMasterScores, pjMasterScores.id.equalsExp(pjSongs.id)),]).get();
    // return query;
    // query.map((row) {
    //   print(row);
    //   dynamic a = row.readTableOrNull(pjSongs);
    //   return a;
    // });
    final aaa = [];
    for (var r in query){
      print(r.readTable(pjSongs));
      aaa.add(r.readTable(pjSongs));
    }
    return aaa;
  }

  static Provider<MyDatabase> provider = Provider((ref) {
    final database = MyDatabase();
    ref.onDispose(database.close);
    return database;
  });
}

class SongWithMaster {
  SongWithMaster(this.songs, this.master);
  final PjSongs songs;
  final PjMasterScores master;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}