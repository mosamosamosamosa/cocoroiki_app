import 'package:cocoroiki_app/components/bottom_button.dart';
import 'package:cocoroiki_app/components/buttom_bar.dart';
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
  bool visible0 = false;
  bool visible1 = false;
  bool visible2 = false;
  bool visible3 = false;
  bool visible4 = false;

  @override
  void initState() {
    if (granCount == 0) {
      visible0 = true;
    } else if (granCount == 1) {
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
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
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
                    visible: visible0,
                    child: Padding(
                        padding: const EdgeInsets.only(bottom: 260),
                        child: Stack(
                          children: [
                            Image.asset('assets/image/board_first.png'),
                            Positioned(
                              top: 50,
                              left: 0,
                              right: 0,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Text(
                                    "おじいちゃんおばあちゃんに\nアプリをいれてもらおう！",
                                    style: TextStyle(
                                      fontSize: 18,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 5
                                        ..color = Color(0xFF3E0E0E),
                                    ),
                                  ),
                                  const Text(
                                    "おじいちゃんおばあちゃんに\nアプリをいれてもらおう！",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ))),
                Visibility(
                  visible: visible1,
                  child: Positioned(
                      bottom: 293,
                      right: deviceW * 0.32,
                      child: GestureDetector(
                          onTap: () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) => TreeModal());
                          },
                          child: SvgPicture.asset('assets/svg/tree1.svg'))),
                ),
                Visibility(
                  visible: visible2,
                  child: Stack(
                    children: [
                      Positioned(
                          left: 50,
                          bottom: 220,
                          child: SvgPicture.asset('assets/svg/tree1.svg')),
                      Positioned(
                          right: 60,
                          bottom: 300,
                          child: SvgPicture.asset('assets/svg/tree1.svg')),
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
                          child: SvgPicture.asset('assets/svg/tree.svg')),
                      Positioned(
                          right: 40,
                          bottom: 280,
                          child: SvgPicture.asset('assets/svg/tree.svg')),
                      Positioned(
                          left: 70,
                          bottom: 370,
                          child: SvgPicture.asset('assets/svg/tree.svg')),
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
                          child: SvgPicture.asset('assets/svg/tree.svg')),
                      Positioned(
                          right: 60,
                          bottom: 330,
                          child: SvgPicture.asset('assets/svg/tree.svg')),
                      Positioned(
                          left: 40,
                          bottom: 220,
                          child: SvgPicture.asset('assets/svg/tree.svg')),
                      Positioned(
                          right: 20,
                          bottom: 180,
                          child: SvgPicture.asset('assets/svg/tree.svg')),
                    ],
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(bottom: 65),
                    child: BottomButton()),
              ],
            )));
  }
}
