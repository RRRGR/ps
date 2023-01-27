import 'dart:io';  //追加

import 'package:drift/drift.dart';
import 'package:drift/native.dart';  //追加
import 'package:path/path.dart' as p;  //追加
import 'package:path_provider/path_provider.dart';
import 'package:riverpod/riverpod.dart';

part 'pj_songs_db.g.dart';

class PjSongs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get songName => text()();
  IntColumn get eDiff => integer()();
  IntColumn get nDiff => integer()();
  IntColumn get hDiff => integer()();
  IntColumn get exDiff =>integer()();
  IntColumn get mDiff => integer()();
}

@DriftDatabase(tables: [PjSongs])
class MyDatabase extends _$MyDatabase {
  MyDatabase(): super(_openConnection());
  @override
  int get schemaVersion => 1;

  Future<int> upsertSong(PjSongsCompanion song) {
    return into(pjSongs).insertOnConflictUpdate(song);
  }

  static Provider<MyDatabase> provider = Provider((ref) {
    final database = MyDatabase();
    ref.onDispose(database.close);
    return database;
  });
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}