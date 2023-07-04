import 'package:cocoroiki_app/components/custom_app_bar.dart';
import 'package:cocoroiki_app/components/grid_item.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/screens/kid/quest/quest_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    List<Widget> gridItem = [
      GridItem(
        text: 'アルバムを注文',
        icon: 'menu_albam.svg',
      ),
      GridItem(
        text: 'プロフィール',
        icon: 'menu_prof.svg',
      ),
      GridItem(
        text: '安否通知設定',
        icon: 'menu_anpi.svg',
      )
    ];
    return Scaffold(
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: deviceH,
                width: 50,
                decoration: BoxDecoration(color: Color(0xFFE9F9D4)),
              ),
              Container(
                height: deviceH,
                width: 50,
                decoration: BoxDecoration(color: Color(0xFFE9F9D4)),
              ),
              Container(
                height: deviceH,
                width: 50,
                decoration: BoxDecoration(color: Color(0xFFE9F9D4)),
              ),
              Container(
                height: deviceH,
                width: 50,
                decoration: BoxDecoration(color: Color(0xFFE9F9D4)),
              )
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 52),
              child: Column(
                children: [
                  SizedBox(height: 100),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QuestScreen()));
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset('assets/svg/quest_menu.svg'),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(width: deviceW * 0.18),
                            SvgPicture.asset('assets/svg/tree_menu.svg'),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Text(
                                  'ひろばへ',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Zen-B',
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 4.5
                                      ..color = kshadoeColor,
                                  ),
                                ),
                                Text(
                                  'ひろばへ',
                                  style: TextStyle(
                                    fontFamily: 'Zen-B',
                                    fontSize: 30,
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
                  Container(
                    height: deviceH * 0.7,
                    width: deviceW,
                    child: GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(24),
                        childAspectRatio: 1.2,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                        crossAxisCount: 2,
                        children: gridItem),
                  )
                  // Row(
                  //   children: [
                  //     Stack(
                  //       children: [
                  //         SvgPicture.asset('assets/svg/menu_sub.svg'),
                  //         Column(
                  //           children: [
                  //             SvgPicture.asset('assets/svg/menu_albam.svg'),
                  //             Stack(
                  //               alignment: Alignment.center,
                  //               children: [
                  //                 Text(
                  //                   'アルバムを注文',
                  //                   style: TextStyle(
                  //                     fontSize: 18,
                  //                     fontFamily: 'Zen-B',
                  //                     foreground: Paint()
                  //                       ..style = PaintingStyle.stroke
                  //                       ..strokeWidth = 4.5
                  //                       ..color = kshadoeColor,
                  //                   ),
                  //                 ),
                  //                 Text(
                  //                   'アルバムを注文',
                  //                   style: TextStyle(
                  //                     fontFamily: 'Zen-B',
                  //                     fontSize: 18,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         )
                  //       ],
                  //     ),
                  //     Stack(
                  //       children: [
                  //         SvgPicture.asset('assets/svg/menu_sub.svg'),
                  //         Column(
                  //           children: [
                  //             SvgPicture.asset('assets/svg/menu_prof.svg'),
                  //             Stack(
                  //               alignment: Alignment.center,
                  //               children: [
                  //                 Text(
                  //                   'アルバムを注文',
                  //                   style: TextStyle(
                  //                     fontSize: 18,
                  //                     fontFamily: 'Zen-B',
                  //                     foreground: Paint()
                  //                       ..style = PaintingStyle.stroke
                  //                       ..strokeWidth = 4.5
                  //                       ..color = kshadoeColor,
                  //                   ),
                  //                 ),
                  //                 Text(
                  //                   'アルバムを注文',
                  //                   style: TextStyle(
                  //                     fontFamily: 'Zen-B',
                  //                     fontSize: 18,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         )
                  //       ],
                  //     )
                  //   ],
                  // )
                ],
              ),
            ),
          ),
          CustomAppBar(title: 'メニュー', reading: 'hu.svg'),
        ],
      ),
      floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SvgPicture.asset('assets/svg/menu_close_button.svg'),
              Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      '閉じる',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Zen-B',
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 4.5
                          ..color = kshadoeColor,
                      ),
                    ),
                    Text(
                      '閉じる',
                      style: TextStyle(
                        fontFamily: 'Zen-B',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
