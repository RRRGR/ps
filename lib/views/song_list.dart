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
    // return FutureBuilder(
    //   future: IsarService().getPjScores(sortSetting),
    //   builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
    //     if (snapshot.hasData) {
    //       print(snapshot.data);
    //       List songData = snapshot.data!;
    //       return Column(
    //         children: [
    //           Row(
    //             children: [
    //               ElevatedButton(
    //                 onPressed: _onPressed,
    //                 child: const Text("Read Photo"),
    //               ),
    //               DropdownButton(
    //                 value: sortSetting,
    //                 items: ['default', 'レベル', '曲名'].map((String value) {
    //                   return DropdownMenuItem<String>(
    //                     value: value,
    //                     child: Text(value),
    //                   );
    //                 }).toList(),
    //                 onChanged: (value) =>
    //                     ref.read(sortProvider.notifier).state = value!,
    //               ),
    //             ],
    //           ),
    //           Expanded(
    //             child: SingleChildScrollView(
    //               scrollDirection: Axis.vertical,
    //               child: FittedBox(
    //                 child: SongDataTable(songData),
    //               ),
    //             ),
    //           ),
    //         ],
    //       );
    //     } else {
    //       return const CircularProgressIndicator();
    //     }
    //   },
    // );
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
                  const DataCell(Text("MAS")),
                  DataCell(Text(e.master.diff.toString())),
                  e.master.bestPerfect == null
                      ? const DataCell(Text("-"))
                      : DataCell(Text(
                          '${e.master.bestPerfect.toString()}-${e.master.bestGreat.toString()}-${e.master.bestGood.toString()}-${e.master.bestBad.toString()}-${e.master.bestMiss.toString()}')),
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
