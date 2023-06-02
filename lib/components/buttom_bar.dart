import 'package:cocoroiki_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtomBar extends StatefulWidget {
  const ButtomBar(
      {super.key,
      required this.pushed,
      required this.icon,
      required this.title});

  final bool pushed;
  final String icon;
  final String title;

  @override
  State<ButtomBar> createState() => _ButtomBarState();
}

class _ButtomBarState extends State<ButtomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        width: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svg/${widget.icon}'),
            Text(widget.title,
                style: TextStyle(
                    fontSize: 11,
                    color: kshadoeColor,
                    fontWeight: FontWeight.bold))
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            // ボタン下
            const BoxShadow(
              color: kshadoeColor,
              offset: Offset(0, 4),
            ),

            // ボタン上
            BoxShadow(
              color: widget.pushed ? kButtomBotton2Color : kButtomBottonColor,
              //blurRadius: 0,
              offset: Offset(0, 0),
            ),
          ],
        ));
  }
}
