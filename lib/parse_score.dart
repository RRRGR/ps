import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:string_similarity/string_similarity.dart';

Map parseScore(RecognizedText recognizedText) {
  List<String> textList = recognizedText.text.split('\n');
  String songName = textList[0];
  String songDiff = textList[1];
  BestMatch bestMatch = StringSimilarity.findBestMatch(
      songDiff, ["EASY", "NORMAL", "HARD", "EXPERT", "MASTER"]);
  print(bestMatch.bestMatch.target);
  songDiff = bestMatch.bestMatch.target!;
  String songScore = "";
  String perfect = "";
  String great = "";
  String good = "";
  String bad = "";
  String miss = '';
  for (int i = 2; i < textList.length; i++) {
    if (textList[i] == "ハイスコア") {
      songScore = textList[i + 1];
    } else if (textList[i] == "MISS") {
      perfect = textList[i + 1];
      great = textList[i + 2];
      good = textList[i + 3];
      bad = textList[i + 4];
      miss = textList[i + 5];
      break;
    }
  }
  print(songName);
  print(songDiff);
  print(songScore);
  Map scoreInfo = {
    "name": songName,
    "diff": songDiff,
    "highScore": songScore,
    "perfect": int.parse(perfect),
    "great": int.parse(great),
    "good": int.parse(good),
    "bad": int.parse(bad),
    "miss": int.parse(miss),
  };
  return scoreInfo;
}
