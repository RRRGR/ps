import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_score/constant.dart';
import 'package:project_score/db/db.dart';
import 'package:project_score/db/pj_songs.dart';
import 'package:project_score/model/ad.dart';
import 'package:project_score/parse_score.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';
import 'package:image/image.dart' as img;

class ShowList extends ConsumerStatefulWidget {
  const ShowList({super.key});
  @override
  ShowListState createState() => ShowListState();
}

class ShowListState extends ConsumerState<ShowList> {
  final TextRecognizer _textRecognizer =
      TextRecognizer(script: TextRecognitionScript.japanese);
  BannerAd myBanner = BannerAd(
    adUnitId: getTestAdBannerUnitId(),
    size: AdSize.banner,
    request: const AdRequest(),
    listener: const BannerAdListener(),
  );
  @override
  void initState() {
    super.initState();
    myBanner.load();
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _onPressed,
                  child: const Text("読み込み"),
                ),
                const Text("ソート:"),
                DropdownButton(
                    value: sortSetting,
                    items: ['デフォルト', 'レベル', '曲名'].map((String value) {
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
                    value: levelSetting,
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
            SizedBox(
              height: 50.0,
              width: double.infinity,
              child: AdWidget(ad: myBanner),
            )
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
      // img.Image? imgImage = img.decodeImage(File(path).readAsBytesSync());
      // imgImage = img.luminanceThreshold(imgImage!);
      // Directory tempDir = await getTemporaryDirectory();
      // String tempPath = '${tempDir.path}/a.png';
      // await (img.Command()
      //       ..decodeImageFile(path)
      //       ..luminanceThreshold()
      //       ..writeToFile(tempPath))
      //     .executeThread();

      // encodeToJpgFile('out/thumbnail-test.png', thumbnail);
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
        DataColumn(label: Text("最高記録")),
      ],
      rows: songData
          .map((e) => DataRow(
                onLongPress: () => showDialog(
                    context: context, builder: (_) => EditScoreAlert(e)),
                cells: [
                  DataCell(SizedBox(
                    width: width / 2.5,
                    child: Text(
                      e.name,
                    ),
                  )),
                  DataCell(Text(levelSetting)),
                  DataCell(DiffText(e)),
                  DataCell(ScoreText(e)),
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
      if (e.master.bestPerfect == null) {
        return const Text("-");
      } else {
        return Text(
            '${e.master.bestPerfect.toString()}-${e.master.bestGreat.toString()}-${e.master.bestGood.toString()}-${e.master.bestBad.toString()}-${e.master.bestMiss.toString()}');
      }
    } else if (diff == "Expert") {
      if (e.expert.bestPerfect == null) {
        return const Text("-");
      } else {
        return Text(
            '${e.expert.bestPerfect.toString()}-${e.expert.bestGreat.toString()}-${e.expert.bestGood.toString()}-${e.expert.bestBad.toString()}-${e.expert.bestMiss.toString()}');
      }
    } else if (diff == "Hard") {
      if (e.hard.bestPerfect == null) {
        return const Text("-");
      } else {
        return Text(
            '${e.hard.bestPerfect.toString()}-${e.hard.bestGreat.toString()}-${e.hard.bestGood.toString()}-${e.hard.bestBad.toString()}-${e.hard.bestMiss.toString()}');
      }
    } else if (diff == "Normal") {
      if (e.normal.bestPerfect == null) {
        return const Text("-");
      } else {
        return Text(
            '${e.normal.bestPerfect.toString()}-${e.normal.bestGreat.toString()}-${e.normal.bestGood.toString()}-${e.normal.bestBad.toString()}-${e.normal.bestMiss.toString()}');
      }
    } else {
      if (e.easy.bestPerfect == null) {
        return const Text("-");
      } else {
        return Text(
            '${e.easy.bestPerfect.toString()}-${e.easy.bestGreat.toString()}-${e.easy.bestGood.toString()}-${e.easy.bestBad.toString()}-${e.easy.bestMiss.toString()}');
      }
    }
  }
}

class NameAndDiffText extends ConsumerWidget {
  final pj_song e;
  const NameAndDiffText(this.e, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diff = ref.watch(levelProvider);
    if (diff == "Master") {
      return Text("${e.name} ${e.master.diff}");
    } else if (diff == "Expert") {
      return Text("${e.name} ${e.expert.diff}");
    } else if (diff == "Hard") {
      return Text("${e.name} ${e.hard.diff}");
    } else if (diff == "Normal") {
      return Text("${e.name} ${e.normal.diff}");
    } else {
      return Text("${e.name} ${e.easy.diff}");
    }
  }
}

class EditScoreAlert extends ConsumerWidget {
  final pj_song e;
  EditScoreAlert(this.e, {super.key});
  Map scoreMap = {
    'songName': '',
    'diff': '',
    'perfect': 0,
    'great': 0,
    'good': 0,
    'bad': 0,
    'miss': 0
  };
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final diff = ref.watch(levelProvider);
    return AlertDialog(
      title: NameAndDiffText(e),
      content: SizedBox(
        height: width / 2.5,
        width: height / 2.5,
        child: ListView(
          shrinkWrap: true,
          children: [
            TextField(
              maxLength: 4,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Perfect',
              ),
              onChanged: (value) => scoreMap['perfect'] = int.parse(value),
            ),
            TextField(
              maxLength: 4,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Great',
              ),
              onChanged: (value) => scoreMap['great'] = int.parse(value),
            ),
            TextField(
              maxLength: 4,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Good',
              ),
              onChanged: (value) => scoreMap['good'] = int.parse(value),
            ),
            TextField(
              maxLength: 4,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Bad',
              ),
              onChanged: (value) => scoreMap['bad'] = int.parse(value),
            ),
            TextField(
              maxLength: 4,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Miss',
              ),
              onChanged: (value) => scoreMap['miss'] = int.parse(value),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text(
            'スコアを更新',
            style: TextStyle(color: Colors.lightBlue),
          ),
          onPressed: () async {
            scoreMap['songName'] = e.name;
            scoreMap['diff'] = diff;
            print(scoreMap);
            await IsarService().updateFromForm(scoreMap);
            ref.refresh(streamSongDataProvider);
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}

class ReadingAlert extends ConsumerWidget {
  const ReadingAlert({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const AlertDialog(
      content: Text('準備中...'),
    );
  }
}
