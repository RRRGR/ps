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
    final sortSetting = ref.watch(sortProvider);
    final levelSetting = ref.watch(levelProvider);
    AsyncValue songDataProv = ref.watch(streamSongDataProvider);
    return songDataProv.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
      data: (songData) {
        return Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: _onPressed,
                  child: const Text("Read Photo"),
                ),
                const Text("ソート:"),
                DropdownButton(
                    value: sortSetting,
                    items: ['default', 'レベル', '曲名'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      ref.read(sortProvider.notifier).state = value!;
                      ref.refresh(streamSongDataProvider);
                    }),
                DropdownButton(
                    value: sortSetting,
                    items: ['Easy', 'Normal', 'Hard', 'Expert', 'Master']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      ref.read(levelProvider.notifier).state = value!;
                      ref.refresh(streamSongDataProvider);
                    }),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: FittedBox(
                  child: SongDataTable(songData),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future processImage(InputImage inputImage) async {
    final recognizedText = await _textRecognizer.processImage(inputImage);
    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
    } else {
      Map scoreInfo = parseScore(recognizedText);
      _textRecognizer.close();
      return scoreInfo;
    }
  }

  void _onPressed() async {
    final List<XFile> images = await ImagePicker().pickMultiImage();
    if (images.isEmpty) return;
    for (XFile image in images) {
      dynamic path = image.path;
      if (path == null) {
        return;
      }
      final inputImage = InputImage.fromFilePath(path);
      Map scoreInfo;
      try {
        scoreInfo = await processImage(inputImage);
      } catch (e) {
        print(e);
        if (!mounted) return;
        showDialog(context: context, builder: (_) => const ErrorAlert());
        return;
      }
      await IsarService().updateMaster(scoreInfo);
    }
    if (!mounted) return;
    showDialog(context: context, builder: (_) => const OKAlert());
  }
}

class SongDataTable extends ConsumerWidget {
  final List songData;
  const SongDataTable(this.songData, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final levelSetting = ref.watch(levelProvider);
    double width = MediaQuery.of(context).size.width;
    return DataTable(
      columnSpacing: 8,
      columns: const [
        DataColumn(label: Text("曲名")),
        DataColumn(label: Text("難易度")),
        DataColumn(label: Text("レベル")),
        DataColumn(label: Text("Best Score")),
      ],
      rows: songData
          .map((e) => DataRow(
                cells: [
                  DataCell(SizedBox(
                    width: width / 2.5,
                    child: Text(
                      e.name,
                    ),
                  )),
                  DataCell(Text(levelSetting)),
                  DataCell(DiffText(e)),
                  e.master.bestPerfect == null
                      ? const DataCell(Text("-"))
                      : DataCell(ScoreText(e)),
                ],
              ))
          .toList(),
    );
  }
}

class OKAlert extends ConsumerWidget {
  const OKAlert({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      content: const Text('スコアが読み取られました。'),
      actions: [
        TextButton(
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.lightBlue),
          ),
          onPressed: () async {
            ref.refresh(streamSongDataProvider);
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}

class ErrorAlert extends ConsumerWidget {
  const ErrorAlert({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      content: const Text('スコアを読み込めない画像がありました。'),
      actions: [
        TextButton(
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.lightBlue),
          ),
          onPressed: () async {
            ref.refresh(streamSongDataProvider);
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}

class DiffText extends ConsumerWidget {
  final pj_song e;

  const DiffText(this.e, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diff = ref.watch(levelProvider);
    if (diff == "Master") {
      return Text(e.master.diff.toString());
    } else if (diff == "Expert") {
      return Text(e.expert.diff.toString());
    } else if (diff == "Hard") {
      return Text(e.hard.diff.toString());
    } else if (diff == "Normal") {
      return Text(e.normal.diff.toString());
    } else {
      return Text(e.easy.diff.toString());
    }
  }
}

class ScoreText extends ConsumerWidget {
  final pj_song e;

  const ScoreText(this.e, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diff = ref.watch(levelProvider);
    if (diff == "Master") {
      return Text(
          '${e.master.bestPerfect.toString()}-${e.master.bestGreat.toString()}-${e.master.bestGood.toString()}-${e.master.bestBad.toString()}-${e.master.bestMiss.toString()}');
    } else if (diff == "Expert") {
      return Text(
          '${e.expert.bestPerfect.toString()}-${e.expert.bestGreat.toString()}-${e.expert.bestGood.toString()}-${e.expert.bestBad.toString()}-${e.expert.bestMiss.toString()}');
    } else if (diff == "Hard") {
      return Text(
          '${e.hard.bestPerfect.toString()}-${e.hard.bestGreat.toString()}-${e.hard.bestGood.toString()}-${e.hard.bestBad.toString()}-${e.hard.bestMiss.toString()}');
    } else if (diff == "Normal") {
      return Text(
          '${e.normal.bestPerfect.toString()}-${e.normal.bestGreat.toString()}-${e.normal.bestGood.toString()}-${e.normal.bestBad.toString()}-${e.normal.bestMiss.toString()}');
    } else {
      return Text(
          '${e.easy.bestPerfect.toString()}-${e.easy.bestGreat.toString()}-${e.easy.bestGood.toString()}-${e.easy.bestBad.toString()}-${e.easy.bestMiss.toString()}');
    }
  }
}
