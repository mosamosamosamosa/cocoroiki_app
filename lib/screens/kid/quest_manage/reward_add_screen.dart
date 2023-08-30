import 'package:cocoroiki_app/components/custom_app_bar.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RewardAddScreen extends StatefulWidget {
  const RewardAddScreen({super.key});

  @override
  State<RewardAddScreen> createState() => _RewardAddScreenState();
}

class _RewardAddScreenState extends State<RewardAddScreen> {
  bool money = false;
  bool toy = false;
  bool snack = false;
  bool sweet = false;
  bool input = false;
  // List<Widget> gridItem = [
  //   GestureDetector(
  //     onTap: () {
  //       setState(() {});
  //     },
  //     child: Stack(
  //       alignment: Alignment.center,
  //       children: [
  //         Container(
  //             width: 80,
  //             height: 94,
  //             decoration: BoxDecoration(
  //                 color: Colors.transparent,
  //                 border: Border.all(color: Color(0xFF90C659), width: 2),
  //                 borderRadius: BorderRadius.circular(5))),
  //         Column(
  //           children: [
  //             SizedBox(
  //                 height: 60,
  //                 child:
  //                     SvgPicture.asset('assets/svg/gohoubi_kodukai_icon.svg')),
  //             Stack(
  //               alignment: Alignment.center,
  //               children: [
  //                 Text(
  //                   "おこづかい",
  //                   style: TextStyle(
  //                     fontSize: 12,
  //                     foreground: Paint()
  //                       ..style = PaintingStyle.stroke
  //                       ..strokeWidth = 4
  //                       ..color = Color(0xFF562B13),
  //                   ),
  //                 ),
  //                 const Text(
  //                   "おこづかい",
  //                   style: TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 12,
  //                     color: Colors.white,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   ),
  //   Stack(
  //     alignment: Alignment.center,
  //     children: [
  //       Container(
  //           width: 80,
  //           height: 94,
  //           decoration: BoxDecoration(
  //               color: Colors.transparent,
  //               border: Border.all(color: Color(0xFF90C659), width: 2),
  //               borderRadius: BorderRadius.circular(5))),
  //       Column(
  //         children: [
  //           SizedBox(
  //               height: 60,
  //               child: SvgPicture.asset('assets/svg/gohoubi_kodukai_icon.svg')),
  //           Stack(
  //             alignment: Alignment.center,
  //             children: [
  //               Text(
  //                 "おこづかい",
  //                 style: TextStyle(
  //                   fontSize: 12,
  //                   foreground: Paint()
  //                     ..style = PaintingStyle.stroke
  //                     ..strokeWidth = 4
  //                     ..color = Color(0xFF562B13),
  //                 ),
  //               ),
  //               const Text(
  //                 "おこづかい",
  //                 style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 12,
  //                   color: Colors.white,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ],
  //   ),
  //   Stack(
  //     alignment: Alignment.center,
  //     children: [
  //       Container(
  //           width: 80,
  //           height: 94,
  //           decoration: BoxDecoration(
  //               color: Colors.transparent,
  //               border: Border.all(color: Color(0xFF90C659), width: 2),
  //               borderRadius: BorderRadius.circular(5))),
  //       Column(
  //         children: [
  //           SizedBox(
  //               height: 60,
  //               child: SvgPicture.asset('assets/svg/gohoubi_kodukai_icon.svg')),
  //           Stack(
  //             alignment: Alignment.center,
  //             children: [
  //               Text(
  //                 "おこづかい",
  //                 style: TextStyle(
  //                   fontSize: 12,
  //                   foreground: Paint()
  //                     ..style = PaintingStyle.stroke
  //                     ..strokeWidth = 4
  //                     ..color = Color(0xFF562B13),
  //                 ),
  //               ),
  //               const Text(
  //                 "おこづかい",
  //                 style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 12,
  //                   color: Colors.white,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ],
  //   ),
  //   Stack(
  //     alignment: Alignment.center,
  //     children: [
  //       Container(
  //           width: 80,
  //           height: 94,
  //           decoration: BoxDecoration(
  //               color: Colors.transparent,
  //               border: Border.all(color: Color(0xFF90C659), width: 2),
  //               borderRadius: BorderRadius.circular(5))),
  //       Column(
  //         children: [
  //           SizedBox(
  //               height: 60,
  //               child: SvgPicture.asset('assets/svg/gohoubi_kodukai_icon.svg')),
  //           Stack(
  //             alignment: Alignment.center,
  //             children: [
  //               Text(
  //                 "おこづかい",
  //                 style: TextStyle(
  //                   fontSize: 12,
  //                   foreground: Paint()
  //                     ..style = PaintingStyle.stroke
  //                     ..strokeWidth = 4
  //                     ..color = Color(0xFF562B13),
  //                 ),
  //               ),
  //               const Text(
  //                 "おこづかい",
  //                 style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 12,
  //                   color: Colors.white,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ],
  //   )
  // ];

  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(children: [
      SizedBox(
          width: deviceW,
          child: FittedBox(
              fit: BoxFit.contain,
              child: Image.asset('assets/image/back_check.png'))),
      CustomAppBar(title: 'ご褒美を追加', reading: 'back_button.svg'),
      Positioned(
          bottom: 0,
          child: SizedBox(
              width: deviceW,
              child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.asset('assets/image/reward_add_back.png')))),
      Padding(
        padding: const EdgeInsets.only(top: 150, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ごほうび名',
              style: TextStyle(
                  color: Color(0xFF2F1A09), fontFamily: 'Zen-B', fontSize: 16),
            ),
            SizedBox(height: 8),
            Container(
              width: 330,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xFF90C659), width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextField(
                  onTap: () {
                    setState(() {
                      input = true;
                    });
                  },
                  style: TextStyle(
                    color: input ? Color(0xFF2F1A09) : Color(0xFF747474),
                    fontSize: 16,
                    fontFamily: 'Zen-M',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    height: 1.25,
                    letterSpacing: -0.5,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'ごほうび名を入力',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'アイコン',
                    style: TextStyle(
                        color: Color(0xFF2F1A09),
                        fontFamily: 'Zen-B',
                        fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            money = true;
                            toy = false;
                            snack = false;
                            sweet = false;
                          });
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                                width: 80,
                                height: 94,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: money
                                            ? Color(0xFFEB6100)
                                            : Colors.transparent,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(5))),
                            Column(
                              children: [
                                SizedBox(
                                    height: 60,
                                    width: 70,
                                    child: SvgPicture.asset(
                                        'assets/svg/gohoubi_kodukai_icon.svg')),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Text(
                                      "おこづかい",
                                      style: TextStyle(
                                        fontSize: 12,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 4
                                          ..color = Color(0xFF562B13),
                                      ),
                                    ),
                                    const Text(
                                      "おこづかい",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            money = false;
                            toy = true;
                            snack = false;
                            sweet = false;
                          });
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                                width: 80,
                                height: 94,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: toy
                                            ? Color(0xFFEB6100)
                                            : Colors.transparent,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(5))),
                            Column(
                              children: [
                                SizedBox(
                                    height: 60,
                                    width: 70,
                                    child: SvgPicture.asset(
                                        'assets/svg/gohoubi_omocha_icon.svg')),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Text(
                                      "おもちゃ",
                                      style: TextStyle(
                                        fontSize: 12,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 4
                                          ..color = Color(0xFF562B13),
                                      ),
                                    ),
                                    const Text(
                                      "おもちゃ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            money = false;
                            toy = false;
                            snack = true;
                            sweet = false;
                          });
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                                width: 80,
                                height: 94,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: snack
                                            ? Color(0xFFEB6100)
                                            : Colors.transparent,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(5))),
                            Column(
                              children: [
                                SizedBox(
                                    height: 60,
                                    width: 70,
                                    child: SvgPicture.asset(
                                        'assets/svg/gohoubi_okashi_icon.svg')),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Text(
                                      "おかし",
                                      style: TextStyle(
                                        fontSize: 12,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 4
                                          ..color = Color(0xFF562B13),
                                      ),
                                    ),
                                    const Text(
                                      "おかし",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            money = false;
                            toy = false;
                            snack = false;
                            sweet = true;
                          });
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                                width: 80,
                                height: 94,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                        color: sweet
                                            ? Color(0xFFEB6100)
                                            : Colors.transparent,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(5))),
                            Column(
                              children: [
                                SizedBox(
                                    height: 60,
                                    width: 70,
                                    child: SvgPicture.asset(
                                        'assets/svg/gohoubi_sweet_icon.svg')),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Text(
                                      "スイーツ",
                                      style: TextStyle(
                                        fontSize: 12,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 4
                                          ..color = Color(0xFF562B13),
                                      ),
                                    ),
                                    const Text(
                                      "スイーツ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Positioned(
        bottom: 100,
        left: 0,
        right: 0,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset('assets/svg/reward_add_button.svg'),
            Stack(alignment: Alignment.center, children: [
              Text(
                '追加する',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Zen-B',
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 5
                    ..color = Color(0xFF835237),
                ),
              ),
              Text(
                '追加する',
                style: TextStyle(
                  fontFamily: 'Zen-B',
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ])
          ],
        ),
      )
    ]));
  }
}
