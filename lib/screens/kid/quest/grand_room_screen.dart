import 'package:cocoroiki_app/components/bottom_button.dart';
import 'package:cocoroiki_app/components/buttom_bar.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/screens/kid/quest/quest_modal.dart';
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
                        });
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
                        });
                      },
                      child: SvgPicture.asset('assets/svg/water_mark.svg'))),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 65),
              child: BottomButton(),
            ),
          ])),
    );
  }
}
