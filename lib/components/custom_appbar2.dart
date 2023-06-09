import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/screens/kid/quest/quest_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbar2 extends StatelessWidget {
  const CustomAppbar2({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: deviceW,
          height: 115,
          decoration: BoxDecoration(
            color: kAppBarColor,
            boxShadow: [
              BoxShadow(
                color: Color(0XFF8B8B8B), //色
                spreadRadius: 0.5,
                blurRadius: 0.5,
                //offset: Offset(1, 1),
              ),
            ],
          ),
        ),
        Positioned(
            left: 24,
            top: 80,
            child: SvgPicture.asset('assets/svg/humberger.svg')),
        Padding(
          padding: const EdgeInsets.only(bottom: 13),
          child: Text("タイムライン",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        Positioned(
          right: 16,
          top: 56,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QuestScreen()));
            },
            child: Column(
              children: [
                SvgPicture.asset('assets/svg/switch.svg'),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      'ひろばへ',
                      style: TextStyle(
                        fontSize: 11,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Color(0xFF3E0E0E),
                      ),
                    ),
                    Text(
                      'ひろばへ',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
