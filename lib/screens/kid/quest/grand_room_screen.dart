import 'package:cocoroiki_app/components/bottom_button.dart';
import 'package:cocoroiki_app/components/buttom_bar.dart';

import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/screens/kid/quest/quest_modal.dart';
import 'package:cocoroiki_app/screens/kid/quest/quest_screen.dart';
import 'package:cocoroiki_app/screens/kid/timelinekids.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GrandRoomScreen extends StatefulWidget {
  const GrandRoomScreen({super.key});

  @override
  State<GrandRoomScreen> createState() => _GrandRoomScreenState();
}

class _GrandRoomScreenState extends State<GrandRoomScreen> {
  bool visiWatermark = true;
  bool visiJouro = false;
  bool visiQuest = false;
  var _isChanged = false;
  bool visiButton = false;

  bool flagTimeline = false;
  bool flagHome = false;
  bool flagQuest = false;

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
          body: Stack(alignment: Alignment.bottomCenter, children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/image/room_back.png')),
            Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SvgPicture.asset('assets/svg/board.svg'),
                        Positioned(
                          top: 86,
                          left: 32,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(
                                'よしえおばあちゃん',
                                style: TextStyle(
                                  fontSize: 24,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 5
                                    ..color = kshadoeColor,
                                ),
                              ),
                              Text(
                                'よしえおばあちゃん',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    SvgPicture.asset('assets/svg/mater.svg')
                  ],
                )),
            Positioned(
                bottom: 217,
                right: 0,
                left: 0,
                child: SvgPicture.asset('assets/svg/room_tree.svg')),
            Visibility(
              visible: visiQuest,
              child: Positioned(
                  bottom: 300,
                  right: 120,
                  child: GestureDetector(
                      onTap: () {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) => QuestModal());
                      },
                      child: SvgPicture.asset('assets/svg/questmark.svg'))),
            ),
            Visibility(
              visible: visiJouro,
              child: Positioned(
                  top: 216,
                  right: 19,
                  child: Draggable(
                      onDragCompleted: () {
                        print('ドラッグ完了');
                        setState(() {
                          visiJouro = false;
                          _isChanged = false;
                          visiButton = false;
                        });
                        print('ドラッグ完了:$visiButton');
                      },
                      feedback: SvgPicture.asset('assets/svg/jouro.svg'),
                      child: SvgPicture.asset('assets/svg/jouro.svg'))),
            ),
            Visibility(
              visible: visiJouro,
              child: Positioned(
                  bottom: 300,
                  right: 120,
                  child: DragTarget(
                    builder: (BuildContext context, List<Object?> candidateData,
                        List<dynamic> rejectedData) {
                      return SvgPicture.asset('assets/svg/yellowpoint.svg');
                    },
                  )),
            ),
            Visibility(
              visible: visiWatermark,
              child: Positioned(
                  bottom: 300,
                  right: 0,
                  left: 0,
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          visiWatermark = false;
                          visiJouro = true;
                          _isChanged = true;
                        });
                      },
                      child: SvgPicture.asset('assets/svg/water_mark.svg'))),
            ),
            AnimatedPositioned(
                onEnd: () {
                  setState(() {
                    if (!flagTimeline) {
                      print('ここきた');
                      visiButton = true;
                      flagTimeline = true;
                    } else {
                      visiButton = false;
                      flagTimeline = false;
                    }
                    print(visiButton);
                  });
                  // print('タイムライン: visiButton $visiTimelineButton flag $flag');
                },
                left: _isChanged ? deviceW * 0.415 : deviceW * 0.16,
                bottom: 66,
                duration: Duration(milliseconds: 100),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Timelinekids()));
                  },
                  child: ButtomBar(
                    icon: 'clock.svg',
                    pushed: false,
                    title: 'タイムライン',
                  ),
                )),
            Positioned(
                left: deviceW * 0.415,
                bottom: 66,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QuestScreen()));
                  },
                  child: ButtomBar(
                    icon: 'tree_icon.svg',
                    pushed: false,
                    title: 'ひろば',
                  ),
                )),
            AnimatedPositioned(
                //curve: Curves.
                onEnd: () {
                  setState(() {
                    // if (!flagQuest) {
                    //   visiQuestButton = false;
                    //   flagQuest = true;
                    // } else {
                    //   visiQuestButton = true;
                    //   flagQuest = false;
                    // }
                  });
                  print(visiButton);
                },
                right: _isChanged ? deviceW * 0.415 : deviceW * 0.16,
                bottom: 66,
                duration: Duration(milliseconds: 100),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Timelinekids()));
                  },
                  child: ButtomBar(
                    icon: 'book_icon.svg',
                    pushed: false,
                    title: 'クエスト',
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 66),
              child: Visibility(
                visible: visiButton,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      visiJouro = false;
                      visiButton = false;
                      _isChanged = false;
                    });
                  },
                  child: Container(
                      height: 70,
                      width: 70,
                      child: SvgPicture.asset('assets/svg/batsu.svg'),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          // ボタン下
                          BoxShadow(
                            color: kshadoeColor,
                            offset: Offset(0, 4),
                          ),

                          // ボタン上
                          BoxShadow(
                            color: kButtomBottonColor,
                            //blurRadius: 0,
                            offset: Offset(0, 0),
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ])),
    );
  }
}
