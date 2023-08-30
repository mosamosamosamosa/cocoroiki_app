import 'package:cocoroiki_app/data/database.dart';
import 'package:cocoroiki_app/provider/provider.dart';
import 'package:cocoroiki_app/screens/grandparent/grandchild_room.dart';
import 'package:cocoroiki_app/screens/kid/menu_modal.dart';
import 'package:cocoroiki_app/screens/kid/quest/quest_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key, required this.title, required this.reading});
  final String title;
  final String reading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    final userRoleState = ref.watch(userRoleProvider);
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
            width: deviceW,
            child: FittedBox(
                fit: BoxFit.contain,
                child: SvgPicture.asset('assets/svg/app_bar.svg'))),
        Positioned(
          top: userRoleState ? 72 : 78,
          child: Text(title,
              style: TextStyle(
                  fontSize: userRoleState ? 24 : 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
        Positioned(
            top: 80,
            left: 20,
            child: GestureDetector(
                onTap: () {
                  if (reading == 'menu_batsu.svg' ||
                      reading == 'back_button.svg' ||
                      reading == 'reading_batsu.svg') {
                    Navigator.pop(context);
                  } else {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) =>
                            MenuModal(timelineButton: false));
                  }
                },
                child: SvgPicture.asset('assets/svg/$reading'))),
        Positioned(
            top: 86,
            right: 20,
            child: Visibility(
              visible: title == 'アルバム作成' || title == 'サイズ選択',
              child: GestureDetector(
                  onTap: () {},
                  child: Image.asset('assets/image/info_icon.png')),
            )),
      ],
    );
  }
}
