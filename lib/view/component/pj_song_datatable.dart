import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_score/db/pj_songs.dart';
import 'package:project_score/model/provider.dart';
import 'package:project_score/view/component/alerts.dart';

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
