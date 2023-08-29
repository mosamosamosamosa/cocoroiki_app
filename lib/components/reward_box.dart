import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RewardBox extends StatelessWidget {
  const RewardBox(
      {super.key, required this.title, required this.icon, required this.add});

  final String title;
  final String icon;
  final bool add;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset('assets/svg/gohoubi_box.svg'),
        add
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/svg/reward_add.svg'),
                  SizedBox(height: 10),
                  Text(
                    'ご褒美を追加',
                    style: TextStyle(
                        color: Color(0xFF659A2E),
                        fontFamily: 'Zen-B',
                        fontSize: 12),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 46,
                      height: 46,
                      child: SvgPicture.asset('assets/svg/$icon')),
                  SizedBox(height: 4),
                  Text(
                    title,
                    style: TextStyle(
                        color: Color(0xFF2F1A09),
                        fontFamily: 'Zen-B',
                        fontSize: 14),
                  ),
                ],
              ),
      ],
    );
  }
}
