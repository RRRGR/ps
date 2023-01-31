import 'package:isar/isar.dart';

part 'pj_songs.g.dart';

@Collection()
class pj_song {
  Id id = Isar.autoIncrement;

  late String name;
  late pj_diff_and_score easy;
  late pj_diff_and_score normal;
  late pj_diff_and_score hard;
  late pj_diff_and_score expert;
  late pj_diff_and_score master;
}

@embedded
class pj_diff_and_score {
  late int diff;
  int? highScore;
  int? bestPerfect;
  int? bestGreat;
  int? bestGood;
  int? bestBad;
  int? bestMiss;
  bool? FCed;
  bool? APed;
}
