import 'package:isar/isar.dart';

part 'pj_songs.g.dart';

@Collection()
class pj_song {
  Id id = Isar.autoIncrement;

  String? name;
  pj_diff_and_score? easy;
  pj_diff_and_score? normal;
  pj_diff_and_score? hard;
  pj_diff_and_score? expert;
  pj_diff_and_score? master;
}

@embedded
class pj_diff_and_score {
  int? diff;
  int? highScore;
  int? bestPerfect;
  int? bestGreat;
  int? bestGood;
  int? bestBad;
  int? bestMiss;
  bool? FCed;
  bool? APed;
}