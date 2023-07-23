import 'package:cocoroiki_app/components/custom_app_bar.dart';
import 'package:cocoroiki_app/components/grid_item.dart';
import 'package:cocoroiki_app/components/grid_item_kids.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/screens/kid/quest/quest_screen.dart';
import 'package:cocoroiki_app/screens/kid/timelinekids.dart';
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
      GridItemKids(
        text: 'クエスト履歴',
        icon: 'menu_quest_icon.svg',
      ),
      GridItemKids(
        text: 'プロフィール',
        icon: 'menu_albam_icon.svg',
      ),
      GridItemKids(
        text: '安否通知設定',
        icon: 'menu_setting_icon.svg',
      )
    ];
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/image/back_check.png'),
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
                              builder: (context) => const Timelinekids()));
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset('assets/svg/menu_timeline.svg'),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            SizedBox(width: deviceW * 0.24),
                            SvgPicture.asset(
                                'assets/svg/menu_timeline_icon.svg'),
                            SizedBox(
                              width: 7,
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Text(
                                  'タイムラインへ',
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
                                  'タイムラインへ',
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
                      ],
                    ),
                  ),
                  Container(
                    height: deviceH * 0.7,
                    width: deviceW * 0.94,
                    child: GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(24),
                        childAspectRatio: 1.2,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                        crossAxisCount: 3,
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
          CustomAppBar(title: 'メニュー', reading: 'menu_batsu.svg'),
        ],
      ),
    );
  }
}
