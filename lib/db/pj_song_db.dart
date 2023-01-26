import 'package:drift/drift.dart';

part 'pj_songs_db.g.dart';

class pjSongs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text()();
}

@DriftDatabase(tables: [pjSongs])
class pjDatabase extends _$pjDatabase {}
