import 'package:cocoroiki_app/screens/create_account/create_account_screen.dart';
import 'package:cocoroiki_app/screens/kid/quest/quest_screen.dart';
import 'package:cocoroiki_app/screens/kid/timelinekids.dart';
import 'package:cocoroiki_app/screens/login/start_screen.dart';
import 'package:cocoroiki_app/screens/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final audioPlayer = AudioPlayer();
  @override
  void initState() {
    print('BGMスタート');
    audioPlayer.play(AssetSource('assets/bgm/cocoroiki.mp3'));
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Zen-M',
      ),
      home: StartScreen(),
    );
  }
}
