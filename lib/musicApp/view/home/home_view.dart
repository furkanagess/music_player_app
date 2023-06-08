import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:music_player_app/musicApp/base/extension/contex_extension.dart';
import 'package:music_player_app/musicApp/product/constants/app_strings.dart';
import 'package:music_player_app/musicApp/product/constants/color_constants.dart';
import 'package:music_player_app/musicApp/product/widgets/clickable_music_row.dart';
import 'package:music_player_app/musicApp/product/widgets/download_listtile.dart';
import 'package:music_player_app/musicApp/product/widgets/drawer_listtile.dart';
import 'package:music_player_app/musicApp/product/widgets/gradient_button.dart';
import 'package:music_player_app/musicApp/product/widgets/music_listtile.dart';
import 'package:music_player_app/musicApp/view/detail/music_detail_view.dart';
import 'package:music_player_app/musicApp/view/premium/premium_view.dart';
import 'package:music_player_app/musicApp/view/settings/settings_view.dart';

class MusicAppHomeView extends StatefulWidget {
  const MusicAppHomeView({super.key});

  @override
  State<MusicAppHomeView> createState() => _MusicAppHomeViewState();
}

class _MusicAppHomeViewState extends State<MusicAppHomeView> {
  int current = 0;
  List<String> tabs = [
    "Şarkılar",
    "Oynatma Listeleri",
    "Klasörler",
    "Albümler ",
  ];
  List<dynamic> widgets = [
    const MusicListenListView(),
    const MusicGridView(),
    const MusicDownloadListView(),
    const MusicGridView(),
  ];

  final buildBody = <Widget>[];

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(),
      key: _scaffoldKey,
      backgroundColor: const Color(0xff0e0e14),
      body: SafeArea(
        child: ListView(
          children: [
            SearchRow(context),
            HeaderRow(context),
            ChipListView(context),
            AdMob(context),
            widgets[current],
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
              "assets/img/fio_logo.png",
            ),
          ),
          DrawerListTile(
            onTap: () {},
            title: "Kütüphane",
            icon: Icons.library_books,
          ),
          DrawerListTile(
            onTap: () {},
            title: "Ekolayzer",
            icon: Icons.equalizer,
          ),
          DrawerListTile(
            onTap: () {},
            title: "Uyku Zamanlayıcısı",
            icon: Icons.access_alarm,
          ),
          DrawerListTile(
            onTap: () {},
            title: "Dış Görünüm Teması",
            icon: Icons.image,
          ),
          DrawerListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PremiumPageView(),
                  ));
            },
            title: "Reklamları Kaldırın",
            icon: Icons.videocam_off_outlined,
          ),
          DrawerListTile(
            onTap: () {},
            title: "Zil Sesleri Ücretsiz",
            icon: Icons.music_note,
          ),
          DrawerListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPageView(),
                  ));
            },
            title: "Ayarlar",
            icon: Icons.settings,
          ),
        ],
      ),
    );
  }

  Widget AdMob(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => PremiumPopUp(context),
          );
        },
        child: Container(
          height: context.dynamicHeight(0.1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: MusicAppColors().transparentWhite,
          ),
          child: Center(
              child: Text(
            "ADS",
            style: context.textTheme.headlineLarge?.copyWith(
              color: MusicAppColors().white,
            ),
          )),
        ),
      ),
    );
  }

  Widget PremiumPopUp(BuildContext context) {
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
            child: Image.asset("assets/img/fio_logo.png"),
          ),
          SizedBox(
            height: context.dynamicHeight(0.05),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                MusicAppStrings().closeAd,
                style: context.textTheme.bodyLarge?.copyWith(color: MusicAppColors().white, fontWeight: FontWeight.bold),
              ),
              Text(
                MusicAppStrings().monthly,
                style: context.textTheme.bodyLarge?.copyWith(color: MusicAppColors().white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: context.dynamicHeight(0.03),
          ),
          Row(
            children: [
              Text(
                MusicAppStrings().reachProperties,
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
            text: MusicAppStrings().next,
            onTap: () {},
          ),
          SizedBox(
            height: context.dynamicHeight(0.01),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  MusicAppStrings().reachProperties2,
                  style: context.textTheme.bodySmall?.copyWith(color: MusicAppColors().white, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
        ],
      ),
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
            title: Text(
              MusicAppStrings().musicTitle,
            ),
            subtitle: Text(
              MusicAppStrings().musicSubTitle,
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
                "https://picsum.photos/200",
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
                  "ADS",
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

  Row SearchRow(BuildContext context) {
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
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: MusicAppStrings().search,
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

  SizedBox ChipListView(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.1),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: InkWell(
            onTap: () {
              setState(() {
                current = index;
              });
            },
            child: Chip(
              labelStyle: TextStyle(
                color: MusicAppColors().white,
              ),
              label: Text(
                tabs[index],
              ),
              backgroundColor: current == index ? MusicAppColors().purple : MusicAppColors().background,
            ),
          ),
        ),
      ),
    );
  }

  Row HeaderRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            MusicAppStrings().header,
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
            title: Text(
              MusicAppStrings().musicTitle,
            ),
            subtitle: Text(
              MusicAppStrings().musicSubTitle,
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
                "https://picsum.photos/200",
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ClickableMusicRow(
                    onTap: () {},
                    title: MusicAppStrings().playNext,
                    icon: Icons.queue_music,
                  ),
                  ClickableMusicRow(
                    onTap: () {},
                    title: MusicAppStrings().addMusic,
                    icon: Icons.favorite_border,
                  ),
                  ClickableMusicRow(
                    onTap: () {},
                    title: MusicAppStrings().addList,
                    icon: Icons.playlist_add,
                  ),
                  ClickableMusicRow(
                    onTap: () {},
                    title: MusicAppStrings().repeatAll,
                    icon: Icons.replay,
                  ),
                  ClickableMusicRow(
                    onTap: () {},
                    title: MusicAppStrings().sleepTimer,
                    icon: Icons.alarm_on,
                  ),
                  ClickableMusicRow(
                    onTap: () {},
                    title: MusicAppStrings().deleteList,
                    icon: Icons.playlist_remove,
                  ),
                  ClickableMusicRow(
                    onTap: () {},
                    title: MusicAppStrings().report,
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
          showModalBottomSheet(
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
                  title: Text(
                    MusicAppStrings().musicTitle,
                  ),
                  subtitle: Text(
                    MusicAppStrings().musicSubTitle,
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
                      "https://picsum.photos/200",
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
                        "ADS",
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
        },
        tapMusic: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MusicDetailView(),
              ));
        },
        title: MusicAppStrings().musicTitle,
        subTitle: MusicAppStrings().musicSubTitle,
        img: "https://picsum.photos/200",
      ),
    );
  }
}

class MusicListenListView extends StatelessWidget {
  const MusicListenListView({
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
          showModalBottomSheet(
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
                  title: Text(
                    MusicAppStrings().musicTitle,
                  ),
                  subtitle: Text(
                    MusicAppStrings().musicSubTitle,
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
                      "https://picsum.photos/200",
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
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ClickableMusicRow(
                          onTap: () {},
                          title: MusicAppStrings().playNext,
                          icon: Icons.queue_music,
                        ),
                        ClickableMusicRow(
                          onTap: () {},
                          title: MusicAppStrings().addMusic,
                          icon: Icons.favorite_border,
                        ),
                        ClickableMusicRow(
                          onTap: () {},
                          title: MusicAppStrings().addList,
                          icon: Icons.playlist_add,
                        ),
                        ClickableMusicRow(
                          onTap: () {},
                          title: MusicAppStrings().repeatAll,
                          icon: Icons.replay,
                        ),
                        ClickableMusicRow(
                          onTap: () {},
                          title: MusicAppStrings().sleepTimer,
                          icon: Icons.alarm_on,
                        ),
                        ClickableMusicRow(
                          onTap: () {},
                          title: MusicAppStrings().deleteList,
                          icon: Icons.playlist_remove,
                        ),
                        ClickableMusicRow(
                          onTap: () {},
                          title: MusicAppStrings().report,
                          icon: Icons.error,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        tapVert: () {},
        title: MusicAppStrings().musicTitle,
        subTitle: MusicAppStrings().musicSubTitle,
        img: "https://picsum.photos/200",
      ),
    );
  }
}

class MusicGridView extends StatelessWidget {
  const MusicGridView({
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MusicDetailView(),
                    ),
                  );
                },
                child: Container(
                  width: context.dynamicWidth(0.42),
                  height: context.dynamicHeight(0.25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: NetworkImage(
                        "https://picsum.photos/200",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MusicDetailView(),
                    ),
                  );
                },
                title: Text(
                  MusicAppStrings().musicTitle,
                  style: TextStyle(
                    color: MusicAppColors().white,
                  ),
                ),
                subtitle: Text(
                  MusicAppStrings().musicSubTitle,
                  style: TextStyle(
                    color: MusicAppColors().white,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
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
        showModalBottomSheet(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
          backgroundColor: MusicAppColors().darkBlue,
          context: context,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
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
                  text: "İsimlendir",
                  onTap: () {},
                )
              ],
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(left: 12, top: 12),
        child: DottedBorder(
          borderType: BorderType.RRect,
          strokeCap: StrokeCap.butt,
          strokeWidth: 2.0,
          dashPattern: [
            10.0,
          ],
          radius: Radius.circular(10),
          color: MusicAppColors().transparentWhite,
          child: Container(
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
                  "Oynatma Listesi \n        Oluştur",
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
}
