import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_score/model/provider.dart';
import 'package:project_score/db/db.dart';
import 'package:project_score/model/ad.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:project_score/view/component/choose_photo_button.dart';
import 'package:project_score/view/component/pj_song_datatable.dart';
import 'package:project_score/view/component/sort_buttons.dart';

class ShowList extends ConsumerStatefulWidget {
  const ShowList({super.key});
  @override
  ShowListState createState() => ShowListState();
}

class ShowListState extends ConsumerState<ShowList> {
  BannerAd myBanner = BannerAd(
    adUnitId: getTestAdBannerUnitId(),
    size: AdSize.banner,
    request: const AdRequest(),
    listener: const BannerAdListener(),
  );
  @override
  void initState() {
    super.initState();
    myBanner.load();
    Future(() async {
      await IsarService().updatePjSong();
      ref.refresh(streamSongDataProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    AsyncValue songDataProv = ref.watch(streamSongDataProvider);
    return songDataProv.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
      data: (songData) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                ChoosePhotoButton(),
                Text("ソート:"),
                SortButton(),
                Text("難易度:"),
                DiffButton(),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: FittedBox(
                  child: SongDataTable(songData),
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
              width: double.infinity,
              child: AdWidget(ad: myBanner),
            )
          ],
        );
      },
    );
  }
}
