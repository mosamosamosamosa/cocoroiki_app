import 'package:cocoroiki_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtomBar extends StatefulWidget {
  const ButtomBar({super.key, required this.icon, required this.title});

  final String icon;
  final String title;

  @override
  State<ButtomBar> createState() => _ButtomBarState();
}

class _ButtomBarState extends State<ButtomBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SvgPicture.asset('assets/svg/buttom_button.svg'),
        Positioned(
            top: -8,
            left: 0,
            right: 0,
            child: SizedBox(
                width: 42,
                height: 42,
                child: SvgPicture.asset('assets/svg/${widget.icon}'))),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 12,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 4
                    ..color = Color(0xFF3E0E0E),
                ),
              ),
              Text(
                widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
