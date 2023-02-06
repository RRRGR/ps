import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_score/db/db.dart';
import 'package:project_score/model/process_image.dart';
import 'package:project_score/view/component/alerts.dart';

class ChoosePhotoButton extends ConsumerStatefulWidget {
  const ChoosePhotoButton({super.key});
  @override
  ChoosePhotoButtonState createState() => ChoosePhotoButtonState();
}

class ChoosePhotoButtonState extends ConsumerState<ChoosePhotoButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed,
      child: const Text("読み込み"),
    );
  }

  void _onPressed() async {
    if (!mounted) return;
    showDialog(context: context, builder: (_) => ReadingAlert());
    final List<XFile> images = await ImagePicker().pickMultiImage();
    if (images.isEmpty) {
      if (!mounted) return;
      Navigator.pop(context);
      return;
    }
    for (XFile image in images) {
      dynamic path = image.path;
      if (path == null) {
        return;
      }
      final inputImage = InputImage.fromFilePath(path);
      Map scoreInfo;
      try {
        scoreInfo = await processImage(inputImage);
        await IsarService().updateScore(scoreInfo);
      } catch (e) {
        print(e);
        if (!mounted) return;
        Navigator.pop(context);
        showDialog(context: context, builder: (_) => const ErrorAlert());
        return;
      }
    }
    if (!mounted) return;
    Navigator.pop(context);
    if (!mounted) return;
    showDialog(context: context, builder: (_) => const OKAlert());
  }
}
