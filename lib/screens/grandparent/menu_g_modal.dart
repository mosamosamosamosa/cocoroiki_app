import 'package:cocoroiki_app/components/custom_app_bar.dart';
import 'package:cocoroiki_app/components/grid_item.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/screens/grandparent/qr/qr_scan_screen.dart';
import 'package:cocoroiki_app/screens/kid/albam/albam1_screen.dart';
import 'package:cocoroiki_app/screens/kid/quest/quest_screen.dart';
import 'package:cocoroiki_app/screens/kid/timelinekids.dart';
import 'package:cocoroiki_app/screens/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuGModal extends StatefulWidget {
  const MenuGModal({super.key, required this.timelineButton});

  final bool timelineButton;

  @override
  State<MenuGModal> createState() => _MenuGModalState();
}

class _MenuGModalState extends State<MenuGModal> {
  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    List<Widget> gridItem = [
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Albam1Screen()));
        },
        child: GridItem(
          text: 'アルバムを注文',
          icon: 'menu_albam.svg',
        ),
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
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 548,
              color: Color(0xFF567377),
            ),
            Column(
              children: [
                SizedBox(
                  height: 32,
                ),
                Text('メニュー',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                SizedBox(width: 60),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
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
                                        builder: (context) =>
                                            const QuestScreen()));
                              }
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SvgPicture.asset('assets/svg/quest_menu.svg'),
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                        width: widget.timelineButton
                                            ? deviceW * 0.14
                                            : deviceW * 0.18),
                                    widget.timelineButton
                                        ? SvgPicture.asset(
                                            'assets/svg/menu_timeline_g_icon.svg')
                                        : SvgPicture.asset(
                                            'assets/svg/tree_menu.svg'),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Text(
                                          widget.timelineButton
                                              ? 'タイムラインへ'
                                              : 'ひろばへ',
                                          style: TextStyle(
                                            fontSize: 30,
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
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 24, right: 24),
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
                    Positioned(
                      bottom: 60,
                      right: 16,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              SvgPicture.asset(
                                  'assets/svg/menu_close_button.svg'),
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
                                          ..color = Color(0xFF3E0E0E),
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
                    ),
                    Positioned(
                      bottom: 60,
                      left: 16,
                      child: GestureDetector(
                          onTap: () {
                            if (widget.timelineButton) {
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PostScreen()));
                            }
                          },
                          child: GestureDetector(
                            onTap: () {
                              if (widget.timelineButton) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const QRScanScreen()));
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PostScreen()));
                              }
                            },
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                widget.timelineButton
                                    ? SvgPicture.asset(
                                        'assets/svg/menu_qr_button.svg')
                                    : SvgPicture.asset(
                                        'assets/svg/menu_post_button.svg'),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 14),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Text(
                                        widget.timelineButton
                                            ? 'QRコード'
                                            : '投稿する',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Zen-B',
                                          foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = 4.5
                                            ..color = Color(0xFF3E0E0E),
                                        ),
                                      ),
                                      Text(
                                        widget.timelineButton
                                            ? 'QRコード'
                                            : '投稿する',
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
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
