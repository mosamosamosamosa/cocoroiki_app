import 'package:carousel_slider/carousel_slider.dart';
import 'package:cocoroiki_app/data/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageModal extends StatefulWidget {
  const ImageModal(
      {super.key,
      required this.image,
      required this.activeIndex,
      required this.imageList});

  final String image;
  final int activeIndex;
  final List<String> imageList;

  @override
  State<ImageModal> createState() => _ImageModalState();
}

class _ImageModalState extends State<ImageModal> {
  int activeIndex = 0;

  @override
  void initState() {
    setState(() {
      activeIndex = widget.activeIndex;
    });

    super.initState();
  }

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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                    height: deviceW,
                    initialPage: widget.activeIndex,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) => setState(() {
                      activeIndex = index;
                    }),
                  ),
                  itemCount: widget.imageList.length,
                  itemBuilder: (context, index, realIndex) {
                    final path = widget.imageList[activeIndex];
                    return buildImage(path, activeIndex);
                  },
                ),
                buildIndicator()
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18, left: 14),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset('assets/svg/image_close_icon.svg')),
            ),
            Positioned(
                right: 4,
                top: 4,
                child: SvgPicture.asset('assets/svg/save_icon.svg'))
          ],
        ));
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
        count: widget.imageList.length,
        //エフェクトはドキュメントを見た方がわかりやすい
        effect: JumpingDotEffect(
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: Color(0xFFFCCC00),
            dotColor: Color(0xFFD9D9D9)),
      );
}
