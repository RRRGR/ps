import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_score/db/db.dart';
import 'package:project_score/db/pj_songs_db.dart';
import 'package:project_score/model/load_json.dart';
import 'package:project_score/parse_score.dart';


class ShowList extends ConsumerStatefulWidget{
  const ShowList({super.key});
  @override
  ShowListState createState() => ShowListState();
}

class ShowListState extends ConsumerState<ShowList> {
  final TextRecognizer _textRecognizer = TextRecognizer(script: TextRecognitionScript.japanese);
  @override
  void initState(){
    super.initState();
    final database = ref.read(MyDatabase.provider);
    Future(() async {
      upsertPjSongDb(database);
    });
  }

  @override
  Widget build(BuildContext context) {
    final database = ref.watch(MyDatabase.provider);
    return FutureBuilder(
      future: database.getAllSongs,
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          List songData = snapshot.data!;
          return Column(
            children: [
              ElevatedButton(onPressed: () async {
                final List<XFile>? images = await ImagePicker().pickMultiImage();
                for (XFile image in images!) {
                  dynamic path = image.path;
                  if (path == null) {
                    return;
                  }
                  final inputImage = InputImage.fromFilePath(path);
                  List? s = await processImage(inputImage);
                  // database.upsertMaster(PjMasterScoresCompanion.insert(id:1,masterHighScore:2));
                  print(s);
                }
              }, child: Text("Photo")),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: songData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _items(songData[index], context);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
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

  Widget _items(PjSong songData, BuildContext context) {
    return Container(
      child: Scrollbar(
        child: Text(songData.songName),
      ),
    );
  }

  Future processImage(InputImage inputImage) async {
    final recognizedText = await _textRecognizer.processImage(inputImage);
    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
    } else {
      List s = parseScore(recognizedText);
      _textRecognizer.close();
      return s;
    }
  }
}
