import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/screens/kid/quest/present_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class QuestCheckModa extends StatefulWidget {
  const QuestCheckModa({super.key});

  @override
  State<QuestCheckModa> createState() => _QuestCheckModaState();
}

class _QuestCheckModaState extends State<QuestCheckModa> {
  final controller = TextEditingController();
  bool visiCheck = false;
  bool open = false;
  bool result = false;
  int flag = 0;
  bool mokumoku = false;

  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );

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
      child: visiCheck
          ? open
              ? result
                  ? Stack(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset(
                                'assets/svg/present_result_board.svg'),
                            Positioned(
                                top: 214,
                                child:
                                    SvgPicture.asset('assets/svg/ribon.svg')),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('レア度',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Zen-B',
                                            fontSize: 24)),
                                    SizedBox(width: 5),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/svg/star_yellow.svg'),
                                        SvgPicture.asset(
                                            'assets/svg/star_grey.svg'),
                                        SvgPicture.asset(
                                            'assets/svg/star_grey.svg'),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 14),
                                SvgPicture.asset('assets/svg/kozukai.svg'),
                                SizedBox(height: 14),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Text(
                                      '１０えんゲット',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        height: 1.2,
                                        fontSize: 24,
                                        fontFamily: 'Zen-B',
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 5
                                          ..color = Color(0xFF562B13),
                                      ),
                                    ),
                                    Text(
                                      '１０えんゲット',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          height: 1.2,
                                          fontFamily: 'Zen-B',
                                          fontSize: 24,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Positioned(
                                top: 340,
                                left: 130,
                                child: SvgPicture.asset(
                                    'assets/svg/kirakira.svg')),
                            Positioned(
                                top: 420,
                                left: 110,
                                child: SvgPicture.asset(
                                    'assets/svg/kirakira.svg')),
                            Positioned(
                                top: 410,
                                right: 110,
                                child: SvgPicture.asset(
                                    'assets/svg/kirakira.svg')),
                            Positioned(
                                top: 350,
                                right: 120,
                                child: SvgPicture.asset(
                                    'assets/svg/kirakira.svg')),
                          ],
                        ),
                        Positioned(
                          bottom: 160,
                          left: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child:
                                Stack(alignment: Alignment.center, children: [
                              SvgPicture.asset('assets/svg/next_push.svg'),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Text(
                                    'とじる',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Zen-B',
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 4.5
                                        ..color = kshadoeColor,
                                    ),
                                  ),
                                  Text(
                                    'とじる',
                                    style: TextStyle(
                                      fontFamily: 'Zen-B',
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            ]),
                          ),
                        )
                      ],
                    )
                  : mokumoku
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              mokumoku = false;

                              result = true;
                            });
                          },
                          child: SizedBox(
                              height: deviceH,
                              child: FittedBox(
                                  fit: BoxFit.fitHeight,
                                  child: Lottie.asset(
                                      'assets/json/mokumoku.json'))))
                      : Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  mokumoku = true;
                                });
                                Future.delayed(Duration(milliseconds: 1800),
                                    () {
                                  setState(() {
                                    mokumoku = false;
                                    result = true;
                                  });
                                  // });
                                });
                              },
                              child: Lottie.asset(
                                  'assets/json/present_open (2).json')))
              : flag == 3
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          open = true;
                        });
                      },
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(
                                'おかあさんといっしょに\nプレゼントをタッチしてね',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  height: 1.2,
                                  fontSize: 24,
                                  fontFamily: 'Zen-B',
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 4
                                    ..color = Colors.white,
                                ),
                              ),
                              Text(
                                'おかあさんといっしょに\nプレゼントをタッチしてね',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    height: 1.2,
                                    fontFamily: 'Zen-B',
                                    fontSize: 24,
                                    color: Color(0xFF40210F)),
                              ),
                            ],
                          ),
                          Lottie.asset('assets/json/present (2).json'),
                        ],
                      ),
                    )
                  : flag == 0
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              flag = 1;
                            });
                          },
                          child: Lottie.asset('assets/json/Balloon_1.json'))
                      : flag == 1
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  flag = 2;
                                });
                              },
                              child: Lottie.asset('assets/json/Balloon_2.json'))
                          : GestureDetector(
                              onTap: () {
                                setState(() {
                                  flag = 3;
                                });
                              },
                              child: Lottie.asset('assets/json/Balloon_3.json'))
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset('assets/svg/quest_check_board.svg'),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Text(
                              'クエストチェック',
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Zen-B',
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 5
                                  ..color = Color(0xFF835237),
                              ),
                            ),
                            Text(
                              'クエストチェック',
                              style: TextStyle(
                                fontFamily: 'Zen-B',
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 28),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset('assets/svg/check_word.svg'),
                            Padding(
                              padding: const EdgeInsets.only(right: 24),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    //controller.text = value;
                                  });
                                },
                                textAlign: TextAlign.center,
                                controller: controller,
                                //autofocus: true,
                                //focusNode: _focusNode,
                                textInputAction: TextInputAction.next,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: kFontColor,
                                    fontFamily: 'Zen-B'),
                                //cursorColor: kFontColor,
                                showCursor: true,

                                //keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  hintText: '合言葉を入力',
                                  hintStyle: TextStyle(
                                      color: Colors.white, fontFamily: 'Zen-M'),
                                  contentPadding: EdgeInsets.only(left: 24),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 23),
                GestureDetector(
                    onTap: () {
                      print(controller.text.isNotEmpty);
                      if (controller.text.isNotEmpty) {
                        setState(() {
                          visiCheck = true;
                        });

                        // showDialog(
                        //     barrierDismissible: false,
                        //     context: context,
                        //     builder: (BuildContext context) => PresentModal());
                      }
                    },
                    child: controller.text.isNotEmpty
                        ? Stack(alignment: Alignment.center, children: [
                            SvgPicture.asset('assets/svg/next_push.svg'),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Text(
                                  '次へ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Zen-B',
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 4.5
                                      ..color = kshadoeColor,
                                  ),
                                ),
                                Text(
                                  '次へ',
                                  style: TextStyle(
                                    fontFamily: 'Zen-B',
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ])
                        : Stack(
                            alignment: Alignment.center,
                            children: [
                              SvgPicture.asset('assets/svg/next_nopush.svg'),
                              Text(
                                '次へ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ))
              ],
            ),
    );
  }
}
