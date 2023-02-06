import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:string_similarity/string_similarity.dart';

Map zparseScore(RecognizedText recognizedText) {
  List<String> textList = recognizedText.text.split('\n');
  print(textList);
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

Map aparseScore(RecognizedText recognizedText) {
  List<String> textList = recognizedText.text.split('\n');
  print(textList);
  String songName = textList[0];
  String songDiff = textList[1];
  BestMatch bestMatch = StringSimilarity.findBestMatch(
      songDiff, ["EASY", "NORMAL", "HARD", "EXPERT", "MASTER"]);
  print(bestMatch.bestMatch.target);
  songDiff = bestMatch.bestMatch.target!;
  String songScore = "";
  int highScore = 0;
  int perfect = 0;
  int great = 0;
  int good = 0;
  int bad = 0;
  int miss = 0;
  int index = 0;
  for (int i = 2; i < textList.length; i++) {
    try {
      highScore = int.parse(textList[i].substring(0, 8));
      index = i + 1;
      break;
    } catch (e) {}
  }
  for (int i = index; i < textList.length; i++) {
    try {
      perfect = int.parse(textList[i].substring(0, 4));
      index = i + 1;
      break;
    } catch (e) {
      print(textList[i]);
    }
  }
  for (int i = index; i < textList.length; i++) {
    try {
      great = int.parse(textList[i].substring(0, 4));
      index = i + 1;
      break;
    } catch (e) {}
  }
  for (int i = index; i < textList.length; i++) {
    try {
      good = int.parse(textList[i].substring(0, 4));
      index = i + 1;
      break;
    } catch (e) {}
  }
  for (int i = index; i < textList.length; i++) {
    try {
      bad = int.parse(textList[i].substring(0, 4));
      index = i + 1;
      break;
    } catch (e) {}
  }
  for (int i = index; i < textList.length; i++) {
    try {
      miss = int.parse(textList[i].substring(0, 4));
      index = i + 1;
      break;
    } catch (e) {}
  }
  print(songName);
  print(songDiff);
  print(songScore);
  Map scoreInfo = {
    "name": songName,
    "diff": songDiff,
    "highScore": highScore,
    "perfect": perfect,
    "great": great,
    "good": good,
    "bad": bad,
    "miss": miss,
  };
  print(scoreInfo);
  return scoreInfo;
}

Map parseScore(RecognizedText recognizedText) {
  List<String> textList = recognizedText.text.split('\n');
  textList = List.generate(
      textList.length, (index) => textList[index].replaceAll("O", "0"));
  print(textList);
  String songName = textList[0];
  String songDiff = textList[1];
  BestMatch bestMatch = StringSimilarity.findBestMatch(
      songDiff, ["EASY", "NORMAL", "HARD", "EXPERT", "MASTER"]);
  if (bestMatch.bestMatch.rating! < 0.5) {
    return {};
  }
  songDiff = bestMatch.bestMatch.target!;
  String songScore = "";
  int highScore = 0;
  int perfect = 0;
  int great = 0;
  int good = 0;
  int bad = 0;
  int miss = 0;
  BestMatch highScoreBestMatch =
      StringSimilarity.findBestMatch("ハイスコア", textList);
  if (highScoreBestMatch.bestMatch.rating! < 0.5) {
    return {};
  }
  BestMatch missBestMatch = StringSimilarity.findBestMatch("MISS", textList);
  if (missBestMatch.bestMatch.rating! < 0.5) {
    return {};
  }
  int highScoreIndex = highScoreBestMatch.bestMatchIndex;
  int missIndex = missBestMatch.bestMatchIndex;
  try {
    highScore = int.parse(textList[highScoreIndex + 1]);
  } catch (e) {}
  int index = missIndex;
  for (int i = index; i < textList.length; i++) {
    try {
      perfect = int.parse(textList[i].substring(0, 4));
      index = i + 1;
      break;
    } catch (e) {
      print(textList[i]);
    }
  }
  for (int i = index; i < textList.length; i++) {
    try {
      great = int.parse(textList[i].substring(0, 4));
      index = i + 1;
      break;
    } catch (e) {}
  }
  for (int i = index; i < textList.length; i++) {
    try {
      good = int.parse(textList[i].substring(0, 4));
      index = i + 1;
      break;
    } catch (e) {}
  }
  for (int i = index; i < textList.length; i++) {
    try {
      bad = int.parse(textList[i].substring(0, 4));
      index = i + 1;
      break;
    } catch (e) {}
  }
  for (int i = index; i < textList.length; i++) {
    try {
      miss = int.parse(textList[i].substring(0, 4));
      index = i + 1;
      break;
    } catch (e) {}
  }
  print(songName);
  print(songDiff);
  print(songScore);
  Map scoreInfo = {
    "name": songName,
    "diff": songDiff,
    "highScore": highScore,
    "perfect": perfect,
    "great": great,
    "good": good,
    "bad": bad,
    "miss": miss,
  };
  print(scoreInfo);
  return scoreInfo;
}
