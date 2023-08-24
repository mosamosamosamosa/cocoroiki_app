import 'package:cocoroiki_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GridItem extends StatelessWidget {
  const GridItem({super.key, required this.text, required this.icon});

  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset('assets/svg/menu_sub.svg'),
        Column(
          children: [
            SizedBox(height: 16),
            SvgPicture.asset('assets/svg/$icon'),
            Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Zen-B',
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 4.5
                      ..color = Color(0xFF3E0E0E),
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'Zen-B',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
