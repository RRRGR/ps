import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_score/constant.dart';
import 'package:project_score/db/db.dart';
import 'package:project_score/db/pj_songs.dart';
import 'package:project_score/model/load_json.dart';
import 'package:project_score/parse_score.dart';
import 'package:isar/isar.dart';
import 'package:project_score/db/pj_songs.dart';

class ShowList extends ConsumerStatefulWidget {
  const ShowList({super.key});
  @override
  ShowListState createState() => ShowListState();
}

class ShowListState extends ConsumerState<ShowList> {
  final TextRecognizer _textRecognizer =
      TextRecognizer(script: TextRecognitionScript.japanese);
  @override
  void initState() {
    super.initState();

    Future(() async {
      await IsarService().updatePjSong();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: IsarService().getPjMaster(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          List songData = snapshot.data!;
          return Column(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    final List<XFile> images =
                        await ImagePicker().pickMultiImage();
                    for (XFile image in images) {
                      dynamic path = image.path;
                      if (path == null) {
                        return;
                      }
                      final inputImage = InputImage.fromFilePath(path);
                      Map s = await processImage(inputImage);
                      await IsarService().updateMaster(s);
                    }
                  },
                  child: Text("Photo")),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: FittedBox(
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text("曲名")),
                        DataColumn(label: Text("難易度")),
                        DataColumn(label: Text("レベル")),
                        DataColumn(label: Text("Perfect")),
                        DataColumn(label: Text("Great")),
                      ],
                      rows: songData
                          .map((e) => DataRow(
                                cells: [
                                  DataCell(Text(e.name)),
                                  const DataCell(Text("master")),
                                  DataCell(Text(e.master.diff.toString())),
                                  e.master.bestPerfect == null
                                      ? DataCell(Text("-"))
                                      : DataCell(Text(
                                          e.master.bestPerfect.toString())),
                                  e.master.bestGreat == null
                                      ? DataCell(Text("-"))
                                      : DataCell(
                                          Text(e.master.bestGreat.toString())),
                                ],
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Future processImage(InputImage inputImage) async {
    final recognizedText = await _textRecognizer.processImage(inputImage);
    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
    } else {
      Map s = parseScore(recognizedText);
      _textRecognizer.close();
      return s;
    }
  }
}
