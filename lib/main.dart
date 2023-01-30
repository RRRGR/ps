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
      ),
      body: ShowList(),
    );
  }
}
