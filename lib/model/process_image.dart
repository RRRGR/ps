import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:project_score/model/parse_score_text.dart';

Future<Map> processImage(InputImage inputImage) async {
  final TextRecognizer textRecognizer =
      TextRecognizer(script: TextRecognitionScript.japanese);
  final recognizedText = await textRecognizer.processImage(inputImage);
  if (inputImage.inputImageData?.size != null &&
      inputImage.inputImageData?.imageRotation != null) {
    return {};
  } else {
    Map scoreInfo = parseScore(recognizedText);
    textRecognizer.close();
    return scoreInfo;
  }
}
