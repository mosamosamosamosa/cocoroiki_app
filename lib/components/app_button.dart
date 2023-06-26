import 'package:cocoroiki_app/constants.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {Key? key,
      required this.text,
      required this.pushable,
      required this.pushColor,
      required this.nopushColor})
      : super(key: key);

  final String text;
  final bool pushable;
  final int pushColor;
  final int nopushColor;

  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    // 文字列とボタンデザインをStackする
    return Stack(
      alignment: Alignment.center,
      children: [
        // ボタンデザインContainer
        Stack(
          //alignment: Alignment.center,
          children: [
            Container(
              width: 170,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  // ボタン下
                  BoxShadow(color: Color(0xFF650303), offset: Offset(0, 4)),

                  // ボタン上
                  BoxShadow(
                    color: pushable == false
                        ? Color(nopushColor)
                        : Color(pushColor),
                    //blurRadius: 0,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
            ),
          ],
        ),
        pushable == false
            ? Text(
                text,
                style: TextStyle(
                    fontFamily: 'Zen-B', fontSize: 20, color: Colors.white),
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    text,
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
                    text,
                    style: TextStyle(
                      fontFamily: 'Zen-B',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
