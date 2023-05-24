import 'package:cocoroiki_app/screens/home_screen.dart';
import 'package:cocoroiki_app/screens/screen.dart';
import 'package:cocoroiki_app/screens/timeline/post_screen.dart';
import 'package:cocoroiki_app/screens/timeline/timeline_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Screen(),
    );
  }
}
