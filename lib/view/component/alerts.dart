import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_score/db/db.dart';
import 'package:project_score/db/pj_songs.dart';
import 'package:project_score/model/provider.dart';

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
            '??????????????????',
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

class ErrorAlert extends ConsumerWidget {
  const ErrorAlert({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      content: const Text('?????????????????????????????????????????????????????????'),
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

class ExplainAlert extends ConsumerWidget {
  const ExplainAlert({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text("?????????"),
      content: const Text(
          '??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????'),
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

class OKAlert extends ConsumerWidget {
  const OKAlert({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      content: const Text('???????????????????????????????????????'),
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

class ReadingAlert extends ConsumerWidget {
  const ReadingAlert({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const AlertDialog(
      content: Text('?????????...'),
    );
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