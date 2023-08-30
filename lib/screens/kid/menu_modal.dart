import 'package:cocoroiki_app/components/custom_app_bar.dart';
import 'package:cocoroiki_app/components/grid_item.dart';
import 'package:cocoroiki_app/components/grid_item_kids.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/screens/kid/albam/albam1_screen.dart';
import 'package:cocoroiki_app/screens/kid/quest/quest_screen.dart';
import 'package:cocoroiki_app/screens/kid/quest_manage/quest_manage_screen.dart';
import 'package:cocoroiki_app/screens/kid/timelinekids.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuModal extends StatefulWidget {
  const MenuModal({super.key, required this.timelineButton});

  final bool timelineButton;

  @override
  State<MenuModal> createState() => _MenuModalState();
}

class _MenuModalState extends State<MenuModal> {
  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    List<Widget> gridItem = [
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const QuestManageScreen()));
        },
        child: GridItemKids(
          text: 'クエスト履歴',
          icon: 'menu_quest_icon.svg',
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Albam1Screen()));
        },
        child: GridItemKids(
          text: 'アルバム注文',
          icon: 'menu_albam_icon.svg',
        ),
      ),
      GridItemKids(
        text: '安否通知設定',
        icon: 'menu_setting_icon.svg',
      )
    ];
    return Dialog(
      elevation: 0,
      backgroundColor: Color(0xFF567377),
      alignment: Alignment.center,
      insetPadding: const EdgeInsets.only(
        bottom: 440,
        top: 0,
        left: 0,
        right: 0,
      ),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: SizedBox(
                      width: 30,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset('assets/svg/batsu.svg'))),
                ),
                Text('メニュー',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                SizedBox(width: 60)
              ],
            ),
            Stack(
              children: [
                //Image.asset('assets/image/back_check.png'),
                Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: Column(
                    children: [
                      //SizedBox(height: 100),
                      GestureDetector(
                        onTap: () {
                          if (widget.timelineButton) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Timelinekids()));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const QuestScreen()));
                          }
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset('assets/svg/menu_timeline.svg'),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                SizedBox(width: deviceW * 0.24),
                                widget.timelineButton
                                    ? SvgPicture.asset(
                                        'assets/svg/menu_timeline_icon.svg')
                                    : SvgPicture.asset(
                                        'assets/svg/menu_hiroba_icon.svg'),
                                SizedBox(
                                  width: widget.timelineButton ? 7 : 12,
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Text(
                                      widget.timelineButton
                                          ? 'タイムラインへ'
                                          : 'ひろばへ',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Zen-B',
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 4.5
                                          ..color = Color(0xFF3E0E0E),
                                      ),
                                    ),
                                    Text(
                                      widget.timelineButton
                                          ? 'タイムラインへ'
                                          : 'ひろばへ',
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
                        height: deviceH * 0.16,
                        width: deviceW * 0.94,
                        child: GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 24,
                              right: 24,
                              bottom: 10,
                            ),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
