import 'package:flutter/material.dart';
import 'package:music_player_app/musicApp/view/home/home_view.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fio App',
      home: MusicAppHomeView(),
    );
  }
}
