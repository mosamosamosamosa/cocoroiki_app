import 'package:cocoroiki_app/components/sub_app_button.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/screens/kid/quest/quest_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class QuestModal extends StatefulWidget {
  const QuestModal({super.key, required this.start});

  final bool start;

  @override
  State<QuestModal> createState() => _QuestModalState();
}

class _QuestModalState extends State<QuestModal> {
  int flag = 4;
  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      alignment: Alignment.center,
      insetPadding: const EdgeInsets.only(
        bottom: 0,
        top: 0,
        left: 0,
        right: 0,
      ),
      child: Stack(
        children: [
          Visibility(
              visible: flag == 4,
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      flag = 3;
                    });
                  },
                  child: Lottie.asset('assets/json/quest_1.json'))),
          Visibility(
              visible: flag == 3,
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      flag = 2;
                    });
                  },
                  child: Lottie.asset('assets/json/quest_2.json'))),
          Visibility(
              visible: flag == 2,
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      flag = 1;
                    });
                    Future.delayed(Duration(milliseconds: 1800), () {
                      setState(() {
                        flag = 0;
                      });
                    });
                  },
                  child: Lottie.asset('assets/json/quest_3.json'))),
          Visibility(
              visible: flag == 1,
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      flag = 0;
                    });
                  },
                  child: SizedBox(
                      height: deviceH,
                      child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Lottie.asset('assets/json/mokumoku.json'))))),
          Visibility(
            visible: flag == 0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset('assets/svg/quest_board.svg'),
                const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 214),
                    child: Text(
                      'きょうのクエスト',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //SizedBox(height: 100),
                      SizedBox(
                        width: 222,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Text(
                              'おさんぽにいこう！',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                height: 1.2,
                                fontSize: 24,
                                fontFamily: 'Zen-B',
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 3
                                  ..color = Colors.white,
                              ),
                            ),
                            Text(
                              'おさんぽにいこう！',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                height: 1.2,
                                fontFamily: 'Zen-B',
                                fontSize: 24,
                                color: Color(0xFF62510C),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
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
                      SizedBox(height: 24),
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
