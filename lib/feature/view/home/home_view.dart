import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:music_player_app/feature/view/home/subHome/home_bottom_sheet.dart';
import 'package:music_player_app/feature/viewModel/home/home_view_model.dart';
import 'package:music_player_app/product/constants/app_constants.dart';
import 'package:music_player_app/product/constants/app_strings.dart';
import 'package:music_player_app/product/constants/color_constants.dart';
import 'package:music_player_app/product/constants/navigation_constants.dart';
import 'package:music_player_app/product/constants/png_constants.dart';
import 'package:music_player_app/product/extension/contex_extension.dart';
import 'package:music_player_app/product/widgets/clickable_music_row.dart';
import 'package:music_player_app/product/widgets/download_listtile.dart';
import 'package:music_player_app/product/widgets/drawer_listtile.dart';
import 'package:music_player_app/product/widgets/music_listtile.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel viewModel = HomeViewModel();
  HomeBottomSheet homeBottomSheet = HomeBottomSheet();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(),
      key: viewModel.scaffoldKey,
      backgroundColor: AppColors().background,
      body: SafeArea(
        child: ListView(
          children: [
            searchRow(context),
            headerRow(context),
            chipListview(context),
            adMob(context, homeBottomSheet),
            viewModel.homeBody[viewModel.current],
          ],
        ),
      ),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      backgroundColor: AppColors().background,
      child: Column(
        children: [
          drawerImage(),
          drawerLibrary(),
          drawerEqualizer(),
          drawerSleepTimer(),
          drawerTheme(),
          drawerAds(context),
          drawerRingtones(),
          drawerSettings(context),
        ],
      ),
    );
  }

  Widget adMob(BuildContext context, HomeBottomSheet homeBottomSheet) {
    return Padding(
      padding: context.paddingLow,
      child: InkWell(
        onTap: () {
          homeBottomSheet.adShowDialog(context);
        },
        child: Container(
          height: context.dynamicHeight(0.1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors().transparentWhite,
          ),
          child: Center(
              child: Text(
            AppStrings.ads,
            style: context.textTheme.headlineLarge?.copyWith(
              color: AppColors().white,
            ),
          )),
        ),
      ),
    );
  }

  Row searchRow(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: context.paddingLowHorizontal,
          child: Card(
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: AppColors().transparentWhite,
            child: IconButton(
              onPressed: () {
                viewModel.scaffoldKey.currentState?.openDrawer();
              },
              icon: Icon(
                Icons.apps,
                color: AppColors().white,
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: context.paddingLow,
            child: TextField(
              decoration: InputDecoration(
                hintText: AppStrings.search,
                hintStyle: context.textTheme.titleMedium?.copyWith(
                  color: AppColors().white,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors().white,
                ),
                filled: true,
                fillColor: AppColors().transparentWhite,
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
        itemCount: viewModel.chips.length,
        itemBuilder: (context, index) => Padding(
          padding: context.paddingMediumHorizontal,
          child: InkWell(
            onTap: () {
              setState(() {
                viewModel.current = index;
              });
            },
            child: Chip(
              side: BorderSide(
                width: 1.2,
                color: AppColors().white,
              ),
              labelStyle: TextStyle(
                color: AppColors().white,
              ),
              label: Text(
                viewModel.chips[index],
              ),
              backgroundColor: viewModel.current == index ? AppColors().purple : AppColors().background,
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
          padding: context.paddingLowHorizontal,
          child: Text(
            AppStrings.header,
            style: context.textTheme.headlineSmall?.copyWith(
              color: AppColors().white,
            ),
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.sort,
            color: AppColors().white,
          ),
        ),
        IconButton(
          padding: context.paddingLowHorizontal,
          onPressed: () {},
          icon: Icon(
            Icons.manage_search,
            color: AppColors().white,
          ),
        ),
        SizedBox(
          width: context.dynamicWidth(0.06),
        )
      ],
    );
  }
}

class MusicDownloadListView extends StatelessWidget {
  MusicDownloadListView({
    super.key,
  });
  final HomeBottomSheet homeBottomSheet = HomeBottomSheet();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 30,
      itemBuilder: (context, index) => DownloadListtie(
        tapDownload: () {
          homeBottomSheet.downloadBottomSheet(context);
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
}

class MusicListView extends StatelessWidget {
  MusicListView({
    super.key,
  });
  final HomeBottomSheet homeBottomSheet = HomeBottomSheet();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 30,
      itemBuilder: (context, index) => MusicListTile(
        onTap: () {
          Navigator.pushNamed(context, NavigationConstants.detail);
        },
        tapMenu: () {
          homeBottomSheet.musicControllBottomSheet(context);
        },
        tapVert: () {},
        title: AppStrings.musicTitle,
        subTitle: AppStrings.musicSubTitle,
        img: AppConstants.imgSource,
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
        CreatePlaylistContainer(),
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
                    color: AppColors().white,
                  ),
                ),
                subtitle: Text(
                  AppStrings.musicSubTitle,
                  style: TextStyle(
                    color: AppColors().white,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: AppColors().white,
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
  CreatePlaylistContainer({
    super.key,
  });
  final HomeBottomSheet bottomSheet = HomeBottomSheet();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        bottomSheet.createPlaylistBottomSheet(context);
      },
      child: Padding(
        padding: context.paddingNormal,
        child: DottedBorder(
          borderType: BorderType.RRect,
          strokeWidth: 2,
          dashPattern: const [
            10.0,
          ],
          radius: const Radius.circular(10),
          color: AppColors().white,
          child: SizedBox(
            width: context.dynamicWidth(0.42),
            height: context.dynamicHeight(0.25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: AppColors().white,
                  size: 30,
                ),
                Text(
                  AppStrings.createPlaylist,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors().white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

ClickableMusicRow reportButton() {
  return ClickableMusicRow(
    onTap: () {},
    title: AppStrings.report,
    icon: Icons.error,
  );
}

ClickableMusicRow deleteButton() {
  return ClickableMusicRow(
    onTap: () {},
    title: AppStrings.deleteList,
    icon: Icons.playlist_remove,
  );
}

ClickableMusicRow sleepTimerButton() {
  return ClickableMusicRow(
    onTap: () {},
    title: AppStrings.sleepTimer,
    icon: Icons.alarm_on,
  );
}

ClickableMusicRow repeatButton() {
  return ClickableMusicRow(
    onTap: () {},
    title: AppStrings.repeatAll,
    icon: Icons.replay,
  );
}

ClickableMusicRow addListButton() {
  return ClickableMusicRow(
    onTap: () {},
    title: AppStrings.addList,
    icon: Icons.playlist_add,
  );
}

ClickableMusicRow addMusicButton() {
  return ClickableMusicRow(
    onTap: () {},
    title: AppStrings.addMusic,
    icon: Icons.favorite_border,
  );
}

ClickableMusicRow playNextButton() {
  return ClickableMusicRow(
    onTap: () {},
    title: AppStrings.playNext,
    icon: Icons.queue_music,
  );
}

DrawerListTile drawerSettings(BuildContext context) {
  return DrawerListTile(
    onTap: () {
      Navigator.pushNamed(context, NavigationConstants.settings);
    },
    title: AppStrings.settings,
    icon: Icons.settings,
  );
}

DrawerListTile drawerRingtones() {
  return DrawerListTile(
    onTap: () {},
    title: AppStrings.ringtones,
    icon: Icons.music_note,
  );
}

DrawerListTile drawerAds(BuildContext context) {
  return DrawerListTile(
    onTap: () {
      Navigator.pushNamed(context, NavigationConstants.premium);
    },
    title: AppStrings.ads,
    icon: Icons.videocam_off_outlined,
  );
}

DrawerListTile drawerTheme() {
  return DrawerListTile(
    onTap: () {},
    title: AppStrings.theme,
    icon: Icons.image,
  );
}

DrawerListTile drawerSleepTimer() {
  return DrawerListTile(
    onTap: () {},
    title: AppStrings.sleepTimer,
    icon: Icons.access_alarm,
  );
}

DrawerListTile drawerEqualizer() {
  return DrawerListTile(
    onTap: () {},
    title: AppStrings.equalizer,
    icon: Icons.equalizer,
  );
}

DrawerListTile drawerLibrary() {
  return DrawerListTile(
    onTap: () {},
    title: AppStrings.library,
    icon: Icons.library_books,
  );
}

DrawerHeader drawerImage() {
  return DrawerHeader(
    child: Image.asset(
      PNGConstants.instance.fioLogo,
    ),
  );
}
