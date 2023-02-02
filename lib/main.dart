import 'package:flutter/material.dart';
import 'package:project_score/db/pj_songs.dart';
import 'package:project_score/views/song_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'face_detector_view.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Face Detector App'),
        actions: [
          IconButton(
            onPressed: () => showDialog(
                context: context, builder: (_) => const ExplainAlert()),
            icon: const Icon(Icons.question_mark),
          )
        ],
      ),
      body: const ShowList(),
    );
  }
}

class ExplainAlert extends ConsumerWidget {
  const ExplainAlert({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text("使い方"),
      content: const Text(
          '「読み込み」ボタンを押しプロセカのリザルトのスクショを選ぶことでスコアを保存できます。写真を上手く読み込めなかった場合は、曲名を長押しして手動でリザルトを入力することができます。'),
      actions: [
        TextButton(
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.lightBlue),
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
