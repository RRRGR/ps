import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

String parseScore(RecognizedText recognizedText) {
  List<String> textList = recognizedText.text.split('\n');
  String songName = textList[0];
  String songDiff = textList[1];
  String songScore = "";
  String songGreat = "";
  for (int i = 2; i < textList.length; i++) {
    if (textList[i] == "ハイスコア") {
      songScore = textList[i + 1];
    } else if (textList[i] == "MISS") {
      songGreat = textList[i + 1];
      break;
    }
  }
  print(songName);
  print(songDiff);
  print(songScore);
  return songGreat;
}
