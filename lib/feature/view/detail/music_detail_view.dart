import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player_app/product/constants/appConstants/app_strings.dart';
import 'package:music_player_app/product/constants/appConstants/navigation_constants.dart';
import 'package:music_player_app/product/constants/assetConstants/color_constants.dart';
import 'package:music_player_app/product/constants/assetConstants/png_constants.dart';
import 'package:music_player_app/product/extension/contex_extension.dart';
import 'package:music_player_app/product/widgets/without_image_listtile.dart';

class MusicDetailView extends StatefulWidget {
  const MusicDetailView({super.key});

  @override
  State<MusicDetailView> createState() => _MusicDetailViewState();
}

class _MusicDetailViewState extends State<MusicDetailView> {
  @override
  void initState() {
    super.initState();

    setAudio();
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future<void> setAudio() async {
    await audioPlayer.setReleaseMode(ReleaseMode.loop);
    final player = AudioCache(prefix: 'assets/audio/');
    final url = await player.load('pence.mp3');
    await audioPlayer.setSourceUrl(url.path);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: context.paddingNormalHorizontal,
          child: Column(
            children: [
              musicImage(),
              SizedBox(height: context.dynamicHeight(0.003)),
              musicNameListTile(),
              sliderTimer(context),
              SizedBox(height: context.dynamicHeight(0.007)),
              musicControllRow(),
              SizedBox(height: context.dynamicHeight(0.05)),
              musicLyrics(context),
            ],
          ),
        ),
      ),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, NavigationConstants.home);
        },
        icon: const Icon(
          Icons.keyboard_arrow_down,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert,
          ),
        )
      ],
      title: Text(
        AppStrings.musicName,
        style: context.textTheme.titleLarge?.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }

  InkWell musicLyrics(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: context.paddingNormalVertical,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.darkBlue,
            borderRadius: BorderRadius.all(context.normalRadius),
          ),
          height: context.dynamicHeight(0.5),
          width: context.dynamicWidth(0.9),
          child: Padding(
            padding: context.paddingNormal,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.lyrics,
                      style: context.textTheme.titleLarge?.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.open_in_full,
                        color: AppColors.white,
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    padding: context.paddingLow,
                    shrinkWrap: true,
                    itemCount: 20,
                    itemBuilder: (context, index) => Padding(
                      padding: context.paddingLowVertical,
                      child: Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                AppStrings.lyricsSample,
                                style: context.textTheme.bodyLarge?.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column sliderTimer(BuildContext context) {
    return Column(
      children: [
        Slider(
          activeColor: AppColors.purple,
          inactiveColor: AppColors.lightWhite,
          max: duration.inSeconds.toDouble(),
          value: position.inSeconds.toDouble(),
          onChanged: (value) async {
            final position = Duration(seconds: value.toInt());
            await audioPlayer.seek(position);
            await audioPlayer.resume();
          },
        ),
        Padding(
          padding: context.paddingNormalHorizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formatTime(position),
                style: context.textTheme.bodySmall?.copyWith(
                  color: AppColors.white,
                ),
              ),
              Text(
                formatTime(duration - position),
                style: context.textTheme.bodySmall?.copyWith(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  Row musicControllRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.library_music,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shuffle,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.skip_previous,
          ),
        ),
        FloatingActionButton(
          backgroundColor: AppColors.purple,
          child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
          onPressed: () async {
            if (isPlaying) {
              await audioPlayer.pause();
            } else {
              await audioPlayer.resume();
            }
          },
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.skip_next,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.alarm_rounded,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.equalizer,
          ),
        ),
      ],
    );
  }

  NoImageTwoIconListTile musicNameListTile() {
    return NoImageTwoIconListTile(
      title: AppStrings.musicTitle,
      subTitle: AppStrings.musicSubTitle,
      iconOne: const Icon(
        Icons.playlist_add,
      ),
      iconTwo: Icon(isFavorite ? Icons.favorite_border : Icons.favorite),
    );
  }

  Container musicImage() {
    return Container(
      height: context.dynamicHeight(0.55),
      width: context.dynamicWidth(0.9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(context.normalRadius),
        image: DecorationImage(
          image: AssetImage(
            PNGConstants.asset,
          ),
        ),
      ),
    );
  }
}
