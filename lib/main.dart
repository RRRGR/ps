import 'package:flutter/material.dart';
import 'package:project_score/views/song_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'face_detector_view.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
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
