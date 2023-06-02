import 'package:cocoroiki_app/constants.dart';
import 'package:flutter/material.dart';

class QuestScreen extends StatefulWidget {
  const QuestScreen({super.key});

  @override
  State<QuestScreen> createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: kBackgroundColors,
            stops: [
              0.3,
              0.6,
            ],
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Positioned(
                    bottom: 0, child: Image.asset('assets/image/back.png'))
              ],
            )));
  }
}
