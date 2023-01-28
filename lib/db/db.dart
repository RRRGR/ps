import 'package:project_score/db/pj_songs_db.dart';
import 'package:project_score/model/load_json.dart';

Future upsertPjSongDb(MyDatabase database) async{
  List songsList = await loadLocalJson();
  String songName = "";
  int eDiff =0;
  int nDiff =0;
  int hDiff =0;
  int exDiff= 0;
  int mDiff =0;
  for (Map songData in songsList){
    songData.forEach((key, value){
      songName = key;
      eDiff = value["e_diff"];
      nDiff = value["n_diff"];
      hDiff = value["h_diff"];
      exDiff = value["ex_diff"];
      mDiff = value["m_diff"];
      database.upsertSong(PjSongsCompanion.insert(songName: songName,eDiff: eDiff,nDiff: nDiff,hDiff: hDiff,exDiff: exDiff,mDiff: mDiff));
    });
  }
}