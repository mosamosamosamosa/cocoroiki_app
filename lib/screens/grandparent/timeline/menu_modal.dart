import 'package:cocoroiki_app/components/custom_app_bar.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuModal extends StatefulWidget {
  const MenuModal({super.key});

  @override
  State<MenuModal> createState() => _MenuModalState();
}

class _MenuModalState extends State<MenuModal> {
  @override
  Widget build(BuildContext context) {
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
      child: Column(
        children: [
          CustomAppBar(title: 'メニュー', reading: 'hu.svg'),
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset('assets/svg/quest_menu.svg'),
              Row(
                children: [
                  SvgPicture.asset('assets/svg/tree_menu.svg'),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'ひろばへ',
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Zen-B',
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 4.5
                            ..color = kshadoeColor,
                        ),
                      ),
                      Text(
                        'ひろばへ',
                        style: TextStyle(
                          fontFamily: 'Zen-B',
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
