import 'package:cocoroiki_app/components/bottom_button.dart';
import 'package:cocoroiki_app/components/buttom_bar.dart';

import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/screens/kid/quest/present_modal.dart';
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
  bool visiWatermark = false;
  bool visiJouro = false;
  bool visiQuest = true;
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
                          top: 80,
                          left: 0,
                          right: 0,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(
                                'よしえおばあちゃん',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'Zen-B',
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 5
                                    ..color = Color(0xFF835237),
                                ),
                              ),
                              Text(
                                'よしえおばあちゃん',
                                style: TextStyle(
                                  fontFamily: 'Zen-B',
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
                    SvgPicture.asset('assets/svg/bar.svg')
                  ],
                )),
            Positioned(
                bottom: 217,
                right: 0,
                left: 0,
                child: GestureDetector(
                    onHorizontalDragUpdate: (details) => print('ふりふり'),
                    onHorizontalDragEnd: (details) => print('ふりふり終了'),
                    child: SvgPicture.asset('assets/svg/room_tree.svg'))),
            Visibility(
              visible: visiQuest,
              child: Positioned(
                  bottom: 300,
                  right: 120,
                  child: GestureDetector(
                      onTap: () {
                        showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (BuildContext context) => PresentModal());
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
                left: _isChanged ? deviceW * 0.38 : deviceW * 0.12,
                bottom: 66,
                duration: Duration(milliseconds: 100),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Timelinekids(parent: false)));
                  },
                  child: ButtomBar(
                    icon: 'timeline_icon.svg',
                    title: 'タイムライン',
                  ),
                )),
            Positioned(
                left: deviceW * 0.38,
                bottom: 66,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QuestScreen()));
                  },
                  child: ButtomBar(
                    icon: 'quest_icon.svg',
                    title: 'クエスト',
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
                right: _isChanged ? deviceW * 0.38 : deviceW * 0.12,
                bottom: 66,
                duration: Duration(milliseconds: 100),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Timelinekids(parent: false)));
                  },
                  child: ButtomBar(
                    icon: 'albam_icon.svg',
                    title: 'アルバム',
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
                    child: Positioned(
                      bottom: 66,
                      right: deviceW * 0.38,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SvgPicture.asset('assets/svg/buttom_button.svg'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 2),
                              SvgPicture.asset('assets/svg/batsu.svg'),
                              SizedBox(width: 2)
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ])),
    );
  }
}
