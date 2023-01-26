import 'package:flutter/material.dart';
import 'package:project_score/model/load_json.dart';

class ShowList extends StatelessWidget {
  const ShowList({Key? key}) : super(key: key);
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
