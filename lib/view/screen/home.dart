import 'package:flutter/material.dart';
import 'package:project_score/view/component/alerts.dart';
import 'package:project_score/view/component/song_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Score'),
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
