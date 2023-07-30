import 'package:flutter/material.dart';
import 'package:music_player_app/feature/view/home/home_view.dart';
import 'package:music_player_app/product/constants/appConstants/app_strings.dart';

class HomeViewModel extends ChangeNotifier {
  int current = 0;
  List<String> chips = [
    AppStrings.musics,
    AppStrings.playlists,
    AppStrings.downloads,
    AppStrings.library,
  ];
  List<Widget> homeBody = [
    MusicListView(),
    const PlaylistGridView(),
    MusicDownloadListView(),
    const PlaylistGridView(),
  ];

  final buildBody = <Widget>[];

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
}
