import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuestHistoryItem extends StatelessWidget {
  const QuestHistoryItem(
      {super.key,
      required this.date,
      required this.title,
      required this.icon,
      required this.gohoubi});
  final String date;
  final String title;
  final String icon;
  final String gohoubi;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 24,
            left: 24,
            right: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: TextStyle(
                        color: Color(0xFF919191),
                        fontFamily: 'Zen-B',
                        fontSize: 14),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: Color(0xFF2F1A09),
                        fontFamily: 'Zen-M',
                        fontSize: 18),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 32,
                      height: 30,
                      child: SvgPicture.asset('assets/svg/$icon')),
                  Text(
                    gohoubi,
                    style: TextStyle(
                        color: Color(0xFF2F1A09),
                        fontFamily: 'Zen-B',
                        fontSize: 12),
                  ),
                ],
              )
            ],
          ),
        ),
        Divider(
          color: Color(0xFFAFAFAF),
          thickness: 0.5,
          height: 24,
          indent: 20,
          endIndent: 20,
        ),
      ],
    );
  }
}
