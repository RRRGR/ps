import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

    String songName = "";
    int eDiff =0;
    int nDiff =0;
    int hDiff =0;
    int exDiff= 0;
    int mDiff =0;
    Future(() async {
      List songsList = await loadLocalJson();
      for (Map songData in songsList){
        songData.forEach((key, value){
          songName = key;
          eDiff = value["e_diff"];
          nDiff = value["n_diff"];
          hDiff = value["h_diff"];
          exDiff = value["ex_diff"];
          mDiff = value["m_diff"];
          database.upsertSong(PjSongsCompanion.insert(songName: songName,eDiff: eDiff,nDiff: nDiff,hDiff: hDiff,exDiff: exDiff,mDiff: mDiff));
        });

      }
      final allCategories = await database.select(database.pjSongs).get();
      print(allCategories);
    });


  }
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: loadLocalJson(),
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

  Widget _items(Map songData, BuildContext context) {
    return Container(
      child: Scrollbar(
        child: Text(pickSongData(songData)),
      ),
    );
  }
}
