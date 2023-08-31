import 'package:carousel_slider/carousel_slider.dart';
import 'package:cocoroiki_app/components/custom_app_bar.dart';
import 'package:cocoroiki_app/screens/kid/albam/albam_create_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Albam3Screen extends StatefulWidget {
  const Albam3Screen({super.key, required this.imageNum});

  final String imageNum;

  @override
  State<Albam3Screen> createState() => _Albam3ScreenState();
}

class _Albam3ScreenState extends State<Albam3Screen> {
  int activeIndex = 0;
  List<String> imageList = [
    'https://dc.watch.impress.co.jp/img/dcw/list/1032/807/001.jpg',
    'https://dc.watch.impress.co.jp/img/dcw/list/1032/807/001.jpg',
    'https://dc.watch.impress.co.jp/img/dcw/list/1032/807/001.jpg'
  ];
  List<String> pageIndex = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31'
  ];
  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: deviceW,
              child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.asset('assets/image/back_check.png'))),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 176),
              child: Column(children: [
                Text(
                  '[ゆうと]のタグから自動で${widget.imageNum}枚の写真を表示しました',
                  style:
                      TextStyle(fontFamily: 'Zen-B', color: Color(0xFFED5500)),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: (int.parse(widget.imageNum) / 2).ceil(),
                    itemBuilder: (context, index) {
                      return index == 0
                          ? Column(
                              children: [
                                Image.asset('assets/image/photobook_title.png'),
                                //SvgPicture.asset('assets/svg/photbook.svg'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: 2),
                                    Text('裏表紙'),
                                    //SizedBox(width: ),
                                    Text('表紙'),
                                    SizedBox(width: 2),
                                  ],
                                ),
                                SizedBox(height: 32),
                              ],
                            )
                          : Column(
                              children: [
                                //SvgPicture.asset('assets/svg/photbook.svg'),
                                Image.asset('assets/image/photobook.png'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: 2),
                                    Text(pageIndex[index]),
                                    //SizedBox(width: ),
                                    Text((2 + index).toString()),
                                    SizedBox(width: 2),
                                  ],
                                ),
                                SizedBox(height: 32),
                              ],
                            );
                    },
                  ),
                )
              ]),
            ),
          ),
          Container(
            height: 160,
            width: deviceW,
            color: Color(0xFF7BAB4A),
          ),
          CustomAppBar(title: 'フォトブック編集', reading: 'back_button.svg'),
          Positioned(
            top: 140,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  width: 18,
                  height: 7,
                  decoration: BoxDecoration(
                    color: Color(0xFFFCCC00),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  width: 18,
                  height: 7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  width: 18,
                  height: 7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                      width: deviceW,
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: SvgPicture.asset('assets/svg/bottom.svg'))),
                  Positioned(
                    right: 27,
                    top: 4,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Text(
                              '1,100 ',
                              style: TextStyle(
                                  fontFamily: 'Zen-B',
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 6)
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '円(${widget.imageNum}枚選択中)',
                              style: TextStyle(
                                  fontFamily: 'Zen-M',
                                  fontSize: 12,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SvgPicture.asset('assets/svg/albam_back_button.svg'),
                          Text(
                            '表紙デザイン編集',
                            style: TextStyle(
                              fontFamily: 'Zen-B',
                              fontSize: 16,
                              color: Color(0xFF7D432A),
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 8),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SvgPicture.asset(
                              'assets/svg/albam_plebyu_button.svg'),
                          Stack(alignment: Alignment.center, children: [
                            Text(
                              'プレビューへ',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Zen-B',
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 5
                                  ..color = Color(0xFF835237),
                              ),
                            ),
                            Text(
                              'プレビューへ',
                              style: TextStyle(
                                fontFamily: 'Zen-B',
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ]),
                        ],
                      )
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
