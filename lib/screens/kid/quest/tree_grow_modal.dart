import 'package:cocoroiki_app/constants.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TreeGrowModal extends StatelessWidget {
  const TreeGrowModal({super.key});

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/image/tree_grobe_modal.png'),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Stack(alignment: Alignment.center, children: [
                SvgPicture.asset('assets/svg/next_push.svg'),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      'とじる',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Zen-B',
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 4.5
                          ..color = kshadoeColor,
                      ),
                    ),
                    Text(
                      'とじる',
                      style: TextStyle(
                        fontFamily: 'Zen-B',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ]),
            ),
          ],
        ));
  }
}
