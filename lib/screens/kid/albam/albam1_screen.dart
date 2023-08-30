import 'package:carousel_slider/carousel_slider.dart';
import 'package:cocoroiki_app/components/custom_app_bar.dart';
import 'package:cocoroiki_app/screens/kid/albam/albam2_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Albam1Screen extends StatefulWidget {
  const Albam1Screen({super.key});

  @override
  State<Albam1Screen> createState() => _Albam1ScreenState();
}

class _Albam1ScreenState extends State<Albam1Screen> {
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 80),
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: deviceW,
                  initialPage: activeIndex,
                  viewportFraction: 1.1,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) => setState(() {
                    activeIndex = index;
                  }),
                ),
                itemCount: imageList.length,
                itemBuilder: (context, index, realIndex) {
                  final path = imageList[activeIndex];
                  return buildImage(path, activeIndex);
                },
              ),
              buildIndicator(),
              SizedBox(height: 36),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Albam2Screen()));
                },
                child: Stack(alignment: Alignment.center, children: [
                  SvgPicture.asset('assets/svg/newmake_button.svg'),
                  Text(
                    '新規作成する',
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Zen-B',
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 5
                        ..color = Color(0xFF835237),
                    ),
                  ),
                  Text(
                    '新規作成する',
                    style: TextStyle(
                      fontFamily: 'Zen-B',
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ]),
              ),
              SizedBox(height: 16),
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset('assets/svg/riewki_button.svg'),
                  Text(
                    '注文履歴を見る',
                    style: TextStyle(
                      fontFamily: 'Zen-B',
                      fontSize: 20,
                      color: Color(0xFF7D432A),
                    ),
                  )
                ],
              ),
            ],
          ),
          CustomAppBar(title: 'アルバム作成', reading: 'reading_batsu.svg'),
        ],
      ),
    );
  }

  Widget buildImage(path, index) => Container(
        //画像間の隙間

        child: Image.network(
          path,
          //fit: BoxFit.cover,
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: imageList.length,
        //エフェクトはドキュメントを見た方がわかりやすい

        effect: JumpingDotEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor: Color(0xFF7CC123),
            dotColor: Color(0xFFD9D9D9)),
      );
}
