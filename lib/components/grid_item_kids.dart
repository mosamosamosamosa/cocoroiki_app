import 'package:cocoroiki_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GridItemKids extends StatelessWidget {
  const GridItemKids({super.key, required this.text, required this.icon});

  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset('assets/svg/grid_item_kids.svg'),
        Column(
          children: [
            SizedBox(height: 16),
            SvgPicture.asset('assets/svg/$icon'),
            SizedBox(height: 4),
            Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 12,
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
                    fontSize: 12,
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
