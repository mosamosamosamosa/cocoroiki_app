import 'package:cocoroiki_app/components/sub_app_button.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/screens/kid/quest/quest_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuestModal extends StatefulWidget {
  const QuestModal({super.key, required this.start});

  final bool start;

  @override
  State<QuestModal> createState() => _QuestModalState();
}

class _QuestModalState extends State<QuestModal> {
  int flag = 3;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      alignment: Alignment.center,
      insetPadding: const EdgeInsets.only(
        bottom: 200,
        top: 200,
        left: 28,
        right: 28,
      ),
      child: Stack(
        children: [
          Visibility(
              visible: flag == 3,
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      flag = 2;
                    });
                  },
                  child: SvgPicture.asset('assets/svg/quest_baloon3.svg'))),
          Visibility(
              visible: flag == 2,
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      flag = 1;
                    });
                  },
                  child: SvgPicture.asset('assets/svg/quest_baloon2.svg'))),
          Visibility(
              visible: flag == 1,
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      flag = 0;
                    });
                  },
                  child: SvgPicture.asset('assets/svg/quest_baloon1.svg'))),
          Visibility(
            visible: flag == 0,
            child: Stack(
              children: [
                SvgPicture.asset('assets/svg/quest_board.svg'),
                const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 14),
                    child: Text(
                      'きょうのクエスト',
                      style: TextStyle(
                          fontFamily: 'Zen-B',
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(height: 100),
                      SizedBox(
                        width: 222,
                        child: Text(
                          'おさんぽにいこう！',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Zen-B',
                            color: kQuestfontColor,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      SizedBox(
                        width: 255,
                        child: Text(
                          'いまはどんなおはながさいているかな？おばあちゃんとさがしてみてね！',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Zen-M',
                            color: kQuestfontColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 290),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuestScreen()));
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset(
                                'assets/svg/quest_button_container.svg'),
                            Stack(
                              children: [
                                Text(
                                  'ひろばへもどる',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Zen-B',
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 4.5
                                      ..color = Color(0xFF835237),
                                  ),
                                ),
                                Text(
                                  'ひろばへもどる',
                                  style: TextStyle(
                                    fontFamily: 'Zen-B',
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset(
                                'assets/svg/quest_button_container.svg'),
                            Stack(
                              children: [
                                Text(
                                  'スタート！',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Zen-B',
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 4.5
                                      ..color = Color(0xFF835237),
                                  ),
                                ),
                                Text(
                                  'スタート！',
                                  style: TextStyle(
                                    fontFamily: 'Zen-B',
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
