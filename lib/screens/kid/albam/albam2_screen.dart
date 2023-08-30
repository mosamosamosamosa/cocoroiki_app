import 'package:carousel_slider/carousel_slider.dart';
import 'package:cocoroiki_app/components/custom_app_bar.dart';
import 'package:cocoroiki_app/screens/kid/albam/albam_create_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Albam2Screen extends StatefulWidget {
  const Albam2Screen({super.key});

  @override
  State<Albam2Screen> createState() => _Albam2ScreenState();
}

class _Albam2ScreenState extends State<Albam2Screen> {
  int activeIndex = 0;
  List<String> imageList = [
    'https://dc.watch.impress.co.jp/img/dcw/list/1032/807/001.jpg',
    'https://dc.watch.impress.co.jp/img/dcw/list/1032/807/001.jpg',
    'https://dc.watch.impress.co.jp/img/dcw/list/1032/807/001.jpg'
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
              padding: const EdgeInsets.only(top: 200),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) =>
                              AlbamCreateModal());
                    },
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      //alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          height: 220,
                          width: 340,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image.network(
                                  'https://photobook.kitamura.jp/pocketbook/images/imgBigInfo_02.jpg')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 100,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '102×102',
                                    style: TextStyle(
                                        fontFamily: 'Zen-M', fontSize: 10),
                                  ),
                                  Text(
                                    'ましかく',
                                    style: TextStyle(
                                        fontFamily: 'Zen-M', fontSize: 20),
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                              Text(
                                '1,100',
                                style: TextStyle(
                                    fontFamily: 'Zen-B', fontSize: 40),
                              ),
                              Column(
                                children: [
                                  Text(
                                    '円(税込)〜',
                                    style: TextStyle(
                                        fontFamily: 'Zen-M', fontSize: 20),
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        height: 220,
                        width: 340,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.network(
                                'https://blog.kitamura.jp/13/4530/timages/R1089821-thumbnail2.JPG?1580878757722')),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 100,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '102×152',
                                  style: TextStyle(
                                      fontFamily: 'Zen-M', fontSize: 10),
                                ),
                                Text(
                                  'よこなが',
                                  style: TextStyle(
                                      fontFamily: 'Zen-M', fontSize: 20),
                                ),
                                SizedBox(height: 8),
                              ],
                            ),
                            Text(
                              '1,450',
                              style:
                                  TextStyle(fontFamily: 'Zen-B', fontSize: 40),
                            ),
                            Column(
                              children: [
                                Text(
                                  '円(税込)〜',
                                  style: TextStyle(
                                      fontFamily: 'Zen-M', fontSize: 20),
                                ),
                                SizedBox(height: 8),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 160,
            width: deviceW,
            color: Color(0xFF7BAB4A),
          ),
          CustomAppBar(title: 'サイズ選択', reading: 'back_button.svg'),
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
        ],
      ),
    );
  }
}
