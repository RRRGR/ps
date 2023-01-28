import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_score/db/db.dart';
import 'package:project_score/db/pj_songs_db.dart';
import 'package:project_score/model/load_json.dart';


class ShowList extends ConsumerStatefulWidget{
  const ShowList({super.key});
  @override
  ShowListState createState() => ShowListState();
}

class ShowListState extends ConsumerState<ShowList> {
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
}
