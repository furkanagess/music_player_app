import 'package:flutter/material.dart';
import 'package:music_player_app/musicApp/base/extension/contex_extension.dart';
import 'package:music_player_app/musicApp/product/constants/app_strings.dart';
import 'package:music_player_app/musicApp/product/constants/color_constants.dart';
import 'package:music_player_app/musicApp/product/widgets/without_image_listtile.dart';
import 'package:music_player_app/musicApp/view/home/home_view.dart';

class MusicDetailView extends StatefulWidget {
  const MusicDetailView({super.key});

  @override
  State<MusicDetailView> createState() => _MusicDetailViewState();
}

class _MusicDetailViewState extends State<MusicDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MusicAppColors().background,
      appBar: getAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              MusicImage(),
              SizedBox(height: context.dynamicHeight(0.003)),
              MusicNameListtile(),
              SliderTimer(context),
              SizedBox(height: context.dynamicHeight(0.007)),
              MusicControlRow(),
              SizedBox(height: context.dynamicHeight(0.05)),
              MusicLyrics(context),
            ],
          ),
        ),
      ),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      backgroundColor: MusicAppColors().background,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MusicAppHomeView(),
            ),
          );
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
      centerTitle: true,
      title: const Text("Albüm Adı"),
    );
  }

  InkWell MusicLyrics(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: MusicAppColors().darkBlue,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 358,
        width: 358,
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Şarkı Sözü",
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: MusicAppColors().white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.open_in_full,
                      color: MusicAppColors().white,
                    ),
                  )
                ],
              ),
              ListView.builder(
                padding: EdgeInsets.only(top: 16),
                shrinkWrap: true,
                itemCount: 7,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    " Just awaken shaken once again, so you know it's on",
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: MusicAppColors().white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column SliderTimer(BuildContext context) {
    return Column(
      children: [
        Slider(
          activeColor: MusicAppColors().white,
          value: 0.4,
          onChanged: (value) {},
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "0:04",
                style: context.textTheme.bodySmall?.copyWith(
                  color: MusicAppColors().white,
                ),
              ),
              Text(
                "0:04",
                style: context.textTheme.bodySmall?.copyWith(
                  color: MusicAppColors().white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row MusicControlRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.library_music,
            color: MusicAppColors().white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shuffle,
            color: MusicAppColors().white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.skip_previous,
            color: MusicAppColors().white,
          ),
        ),
        FloatingActionButton(
          backgroundColor: MusicAppColors().purple,
          onPressed: () {},
          child: Icon(Icons.pause),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.skip_next,
            color: MusicAppColors().white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.alarm_rounded,
            color: MusicAppColors().white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.equalizer,
            color: MusicAppColors().white,
          ),
        ),
      ],
    );
  }

  NoImageTwoIconListTile MusicNameListtile() {
    return NoImageTwoIconListTile(
      title: MusicAppStrings().musicTitle,
      subTitle: MusicAppStrings().musicSubTitle,
      iconOne: const Icon(
        Icons.playlist_add,
      ),
      iconTwo: const Icon(Icons.favorite_border),
      onTap: () {},
    );
  }

  Container MusicImage() {
    return Container(
      height: 358,
      width: 358,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: AssetImage(
            "assets/img/asset.png",
          ),
        ),
      ),
    );
  }
}
