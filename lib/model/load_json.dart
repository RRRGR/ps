import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:project_score/db/pj_songs.dart';


Future<List> loadLocalJson() async {
  String jsonString = await rootBundle.loadString("json/pjsekai_song.json");
  Map jsonData = json.decode(jsonString);
  // print(jsonData["songs"]);
  // List loadedList = jsonData[time];
  // List resultList = [];
  // for (int i = 0; i < loadedList.length; i++) {
  //   String combinedStr = "";
  //   loadedList[i].values.forEach((v) {
  //     combinedStr += v.toString().toLowerCase();
  //   });
  //   if (combinedStr.contains(arg.toLowerCase())) {
  //     resultList.add(loadedList[i]);
  //   }
  // }
  return jsonData["songs"];
}

String pickSongData(Map songData) {
  String songName = "";
  songData.forEach((key, value) {
    songName = key;
  });
  return songName;
}

void upsertSongs(List songsList){

}