import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/screens/kid/quest/tree_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuestScreen extends StatefulWidget {
  const QuestScreen({super.key});

  @override
  State<QuestScreen> createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen> {
  int granCount = 1;
  bool visible1 = false;
  bool visible2 = false;
  bool visible3 = false;
  bool visible4 = false;

  @override
  void initState() {
    if (granCount == 1) {
      visible1 = true;
    } else if (granCount == 2) {
      visible2 = true;
    } else if (granCount == 3) {
      visible3 = true;
    } else {
      visible4 = true;
    }
    setState(() {});
    super.initState();
  }

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
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset('assets/image/back.png')),
                Visibility(
                  visible: visible1,
                  child: Positioned(
                      bottom: 260,
                      child: GestureDetector(
                          onTap: () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) => TreeModal());
                          },
                          child: SvgPicture.asset('assets/svg/green.svg'))),
                ),
                Visibility(
                  visible: visible2,
                  child: Stack(
                    children: [
                      Positioned(
                          left: 50,
                          bottom: 220,
                          child: SvgPicture.asset('assets/svg/green.svg')),
                      Positioned(
                          right: 60,
                          bottom: 300,
                          child: SvgPicture.asset('assets/svg/green.svg')),
                    ],
                  ),
                ),
                Visibility(
                  visible: visible3,
                  child: Stack(
                    children: [
                      Positioned(
                          left: 50,
                          bottom: 200,
                          child: SvgPicture.asset('assets/svg/green.svg')),
                      Positioned(
                          right: 40,
                          bottom: 280,
                          child: SvgPicture.asset('assets/svg/green.svg')),
                      Positioned(
                          left: 70,
                          bottom: 370,
                          child: SvgPicture.asset('assets/svg/green.svg')),
                    ],
                  ),
                ),
                Visibility(
                  visible: visible4,
                  child: Stack(
                    children: [
                      Positioned(
                          left: 50,
                          bottom: 400,
                          child: SvgPicture.asset('assets/svg/green.svg')),
                      Positioned(
                          right: 60,
                          bottom: 330,
                          child: SvgPicture.asset('assets/svg/green.svg')),
                      Positioned(
                          left: 40,
                          bottom: 220,
                          child: SvgPicture.asset('assets/svg/green.svg')),
                      Positioned(
                          right: 20,
                          bottom: 180,
                          child: SvgPicture.asset('assets/svg/green.svg')),
                    ],
                  ),
                ),
              ],
            )));
  }
}
