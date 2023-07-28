import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:music_player_app/musicApp/product/constants/app_constants.dart';
import 'package:music_player_app/musicApp/product/constants/app_strings.dart';
import 'package:music_player_app/musicApp/product/constants/color_constants.dart';
import 'package:music_player_app/musicApp/product/constants/navigation_constants.dart';
import 'package:music_player_app/musicApp/product/extension/contex_extension.dart';
import 'package:music_player_app/musicApp/product/widgets/clickable_music_row.dart';
import 'package:music_player_app/musicApp/product/widgets/download_listtile.dart';
import 'package:music_player_app/musicApp/product/widgets/drawer_listtile.dart';
import 'package:music_player_app/musicApp/product/widgets/gradient_button.dart';
import 'package:music_player_app/musicApp/product/widgets/music_listtile.dart';

class MusicAppHomeView extends StatefulWidget {
  const MusicAppHomeView({super.key});

  @override
  State<MusicAppHomeView> createState() => _MusicAppHomeViewState();
}

class _MusicAppHomeViewState extends State<MusicAppHomeView> {
  int current = 0;
  List<String> chips = [
    AppStrings.musics,
    AppStrings.playlists,
    AppStrings.downloads,
    AppStrings.library,
  ];
  List<Widget> homeBody = [
    const MusicListView(),
    const PlaylistGridView(),
    const MusicDownloadListView(),
    const PlaylistGridView(),
  ];

  final buildBody = <Widget>[];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(),
      key: _scaffoldKey,
      backgroundColor: const Color(0xff0e0e14),
      body: SafeArea(
        child: ListView(
          children: [
            searchRow(context),
            headerRow(context),
            chipListview(context),
            adMob(context),
            homeBody[current],
          ],
        ),
      ),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      backgroundColor: MusicAppColors().background,
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(
              'assets/img/fio_logo.png',
            ),
          ),
          DrawerListTile(
            onTap: () {},
            title: AppStrings.library,
            icon: Icons.library_books,
          ),
          DrawerListTile(
            onTap: () {},
            title: AppStrings.equalizer,
            icon: Icons.equalizer,
          ),
          DrawerListTile(
            onTap: () {},
            title: AppStrings.sleepTimer,
            icon: Icons.access_alarm,
          ),
          DrawerListTile(
            onTap: () {},
            title: AppStrings.theme,
            icon: Icons.image,
          ),
          DrawerListTile(
            onTap: () {
              Navigator.pushNamed(context, NavigationConstants.premium);
            },
            title: AppStrings.ads,
            icon: Icons.videocam_off_outlined,
          ),
          DrawerListTile(
            onTap: () {},
            title: AppStrings.ringtones,
            icon: Icons.music_note,
          ),
          DrawerListTile(
            onTap: () {
              Navigator.pushNamed(context, NavigationConstants.settings);
            },
            title: AppStrings.settings,
            icon: Icons.settings,
          ),
        ],
      ),
    );
  }

  Widget adMob(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: InkWell(
        onTap: () {
          adShowDialog(context);
        },
        child: Container(
          height: context.dynamicHeight(0.1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: MusicAppColors().transparentWhite,
          ),
          child: Center(
              child: Text(
            AppStrings.ads,
            style: context.textTheme.headlineLarge?.copyWith(
              color: MusicAppColors().white,
            ),
          )),
        ),
      ),
    );
  }

  Future<dynamic> adShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 3,
          backgroundColor: MusicAppColors().darkBlue,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: Icon(
                        Icons.close,
                        color: MusicAppColors().white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: context.dynamicWidth(0.7),
                height: context.dynamicHeight(0.2),
                child: Image.asset('assets/img/fio_logo.png'),
              ),
              SizedBox(
                height: context.dynamicHeight(0.05),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.closeAd,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: MusicAppColors().white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    AppStrings.monthly,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: MusicAppColors().white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: context.dynamicHeight(0.03),
              ),
              Row(
                children: [
                  Text(
                    AppStrings.reachProperties,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: MusicAppColors().white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: context.dynamicHeight(0.03),
              ),
              GradientElevatedButton(
                text: AppStrings.next,
                onTap: () {
                  Navigator.pushNamed(context, NavigationConstants.premium);
                },
              ),
              SizedBox(
                height: context.dynamicHeight(0.01),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      AppStrings.reachProperties2,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: MusicAppColors().white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> downloadBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: MusicAppColors().darkBlue,
      context: context,
      builder: (context) => Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(8),
            dense: false,
            iconColor: MusicAppColors().white,
            textColor: MusicAppColors().white,
            title: const Text(
              AppStrings.musicTitle,
            ),
            subtitle: const Text(
              AppStrings.musicSubTitle,
            ),
            trailing: CircleAvatar(
              backgroundColor: MusicAppColors().purple,
              child: const Icon(
                Icons.close,
              ),
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                AppConstants.imgSource,
                height: 64,
                width: 64,
              ),
            ),
            onTap: () {},
          ),
          SizedBox(
            height: context.dynamicHeight(0.01),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: context.dynamicHeight(0.1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MusicAppColors().transparentWhite,
                ),
                child: Center(
                    child: Text(
                  AppStrings.ads,
                  style: context.textTheme.headlineLarge?.copyWith(
                    color: MusicAppColors().white,
                  ),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row searchRow(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Card(
            shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(6)),
            color: MusicAppColors().transparentWhite,
            child: IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              icon: Icon(
                Icons.apps,
                color: MusicAppColors().white,
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                hintText: AppStrings.search,
                hintStyle: context.textTheme.titleMedium?.copyWith(
                  color: MusicAppColors().white,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: MusicAppColors().white,
                ),
                filled: true,
                fillColor: MusicAppColors().transparentWhite,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  SizedBox chipListview(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.1),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: chips.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: InkWell(
            onTap: () {
              setState(() {
                current = index;
              });
            },
            child: Chip(
              side: BorderSide(
                width: 1.2,
                color: MusicAppColors().white,
              ),
              labelStyle: TextStyle(
                color: MusicAppColors().white,
              ),
              label: Text(
                chips[index],
              ),
              backgroundColor: current == index ? MusicAppColors().purple : MusicAppColors().background,
            ),
          ),
        ),
      ),
    );
  }

  Row headerRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            AppStrings.header,
            style: context.textTheme.headlineSmall?.copyWith(
              color: MusicAppColors().white,
            ),
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.sort,
            color: MusicAppColors().white,
          ),
        ),
        IconButton(
          padding: const EdgeInsets.only(left: 16),
          onPressed: () {},
          icon: Icon(
            Icons.manage_search,
            color: MusicAppColors().white,
          ),
        ),
        SizedBox(
          width: context.dynamicWidth(0.06),
        )
      ],
    );
  }

  Future<dynamic> musicDetailBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: MusicAppColors().darkBlue,
      context: context,
      builder: (context) => Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(8),
            dense: false,
            iconColor: MusicAppColors().white,
            textColor: MusicAppColors().white,
            title: const Text(
              AppStrings.musicTitle,
            ),
            subtitle: const Text(
              AppStrings.musicSubTitle,
            ),
            trailing: Wrap(
              spacing: 8,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.skip_previous),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.pause),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.skip_next),
                ),
              ],
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                AppConstants.imgSource,
                height: 64,
                width: 64,
              ),
            ),
            onTap: () {},
          ),
          SizedBox(
            height: context.dynamicHeight(0.01),
          ),
          Container(
            decoration: BoxDecoration(
              color: MusicAppColors().transparentWhite,
              borderRadius: BorderRadius.circular(20),
            ),
            width: 350,
            height: 280,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  ClickableMusicRow(
                    onTap: () {},
                    title: AppStrings.playNext,
                    icon: Icons.queue_music,
                  ),
                  ClickableMusicRow(
                    onTap: () {},
                    title: AppStrings.addMusic,
                    icon: Icons.favorite_border,
                  ),
                  ClickableMusicRow(
                    onTap: () {},
                    title: AppStrings.addList,
                    icon: Icons.playlist_add,
                  ),
                  ClickableMusicRow(
                    onTap: () {},
                    title: AppStrings.repeatAll,
                    icon: Icons.replay,
                  ),
                  ClickableMusicRow(
                    onTap: () {},
                    title: AppStrings.sleepTimer,
                    icon: Icons.alarm_on,
                  ),
                  ClickableMusicRow(
                    onTap: () {},
                    title: AppStrings.deleteList,
                    icon: Icons.playlist_remove,
                  ),
                  ClickableMusicRow(
                    onTap: () {},
                    title: AppStrings.report,
                    icon: Icons.error,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MusicDownloadListView extends StatelessWidget {
  const MusicDownloadListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 30,
      itemBuilder: (context, index) => DownloadListtie(
        tapDownload: () {
          bottomSheet(context);
        },
        tapMusic: () {
          Navigator.pushNamed(context, NavigationConstants.detail);
        },
        title: AppStrings.musicTitle,
        subTitle: AppStrings.musicSubTitle,
        img: AppConstants.imgSource,
      ),
    );
  }

  Future<dynamic> bottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      backgroundColor: MusicAppColors().darkBlue,
      context: context,
      builder: (context) => Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(8),
            dense: false,
            iconColor: MusicAppColors().white,
            textColor: MusicAppColors().white,
            title: const Text(
              AppStrings.musicTitle,
            ),
            subtitle: const Text(
              AppStrings.musicSubTitle,
            ),
            trailing: CircleAvatar(
              backgroundColor: MusicAppColors().purple,
              child: const Icon(
                Icons.close,
              ),
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                AppConstants.imgSource,
                height: 64,
                width: 64,
              ),
            ),
            onTap: () {},
          ),
          SizedBox(
            height: context.dynamicHeight(0.01),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: context.dynamicHeight(0.1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MusicAppColors().transparentWhite,
                ),
                child: Center(
                    child: Text(
                  AppStrings.ads,
                  style: context.textTheme.headlineLarge?.copyWith(
                    color: MusicAppColors().white,
                  ),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MusicListView extends StatelessWidget {
  const MusicListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 30,
      itemBuilder: (context, index) => MusicListTile(
        tapMenu: () {
          musicControllBottomSheet(context);
        },
        tapVert: () {},
        title: AppStrings.musicTitle,
        subTitle: AppStrings.musicSubTitle,
        img: AppConstants.imgSource,
      ),
    );
  }

  Future<dynamic> musicControllBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: MusicAppColors().darkBlue,
      context: context,
      builder: (context) => Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(8),
            dense: false,
            iconColor: MusicAppColors().white,
            textColor: MusicAppColors().white,
            title: const Text(
              AppStrings.musicTitle,
            ),
            subtitle: const Text(
              AppStrings.musicSubTitle,
            ),
            trailing: Wrap(
              spacing: 8,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.skip_previous),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.pause),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.skip_next),
                ),
              ],
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                AppConstants.imgSource,
                height: 64,
                width: 64,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, 'detail');
            },
          ),
          SizedBox(
            height: context.dynamicHeight(0.01),
          ),
          Container(
            decoration: BoxDecoration(
              color: MusicAppColors().transparentWhite,
              borderRadius: BorderRadius.circular(20),
            ),
            width: 350,
            height: 280,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  ClickableMusicRow(
                    onTap: () {},
                    title: AppStrings.playNext,
                    icon: Icons.queue_music,
                  ),
                  ClickableMusicRow(
                    onTap: () {},
                    title: AppStrings.addMusic,
                    icon: Icons.favorite_border,
                  ),
                  ClickableMusicRow(
                    onTap: () {},
                    title: AppStrings.addList,
                    icon: Icons.playlist_add,
                  ),
                  ClickableMusicRow(
                    onTap: () {},
                    title: AppStrings.repeatAll,
                    icon: Icons.replay,
                  ),
                  ClickableMusicRow(
                    onTap: () {},
                    title: AppStrings.sleepTimer,
                    icon: Icons.alarm_on,
                  ),
                  ClickableMusicRow(
                    onTap: () {},
                    title: AppStrings.deleteList,
                    icon: Icons.playlist_remove,
                  ),
                  ClickableMusicRow(
                    onTap: () {},
                    title: AppStrings.report,
                    icon: Icons.error,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlaylistGridView extends StatelessWidget {
  const PlaylistGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CreatePlaylistContainer(),
        SizedBox(height: context.dynamicHeight(0.05)),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 12,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.8,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, NavigationConstants.detail);
                },
                child: Container(
                  width: context.dynamicWidth(0.42),
                  height: context.dynamicHeight(0.25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: NetworkImage(
                        AppConstants.imgSource,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, NavigationConstants.detail);
                },
                title: Text(
                  AppStrings.musicTitle,
                  style: TextStyle(
                    color: MusicAppColors().white,
                  ),
                ),
                subtitle: Text(
                  AppStrings.musicSubTitle,
                  style: TextStyle(
                    color: MusicAppColors().white,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: MusicAppColors().white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CreatePlaylistContainer extends StatelessWidget {
  const CreatePlaylistContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        createPlaylistBottomSheet(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 12, top: 12),
        child: DottedBorder(
          borderType: BorderType.RRect,
          strokeWidth: 2,
          dashPattern: const [
            10.0,
          ],
          radius: const Radius.circular(10),
          color: MusicAppColors().white,
          child: SizedBox(
            width: context.dynamicWidth(0.42),
            height: context.dynamicHeight(0.25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: MusicAppColors().white,
                  size: 30,
                ),
                Text(
                  AppStrings.createPlaylist,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: MusicAppColors().white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> createPlaylistBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      backgroundColor: MusicAppColors().darkBlue,
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: AppStrings.playlistName,
                hintStyle: context.textTheme.bodyMedium?.copyWith(
                  color: MusicAppColors().lightWhite,
                ),
                hoverColor: MusicAppColors().white,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: MusicAppColors().orange),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: MusicAppColors().pink),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: MusicAppColors().orange),
                ),
              ),
            ),
            GradientElevatedButton(
              text: AppStrings.giveName,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
