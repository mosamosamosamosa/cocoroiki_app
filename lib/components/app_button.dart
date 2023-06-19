import 'package:cocoroiki_app/constants.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.text,
    required this.pushable,
  }) : super(key: key);

  final String text;
  final bool pushable;
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
                  BoxShadow(
                      color: pushable == false
                          ? kshadoeColor
                          : const Color(0xFF76C8D9),
                      offset: Offset(0, 3)),

                  // ボタン上
                  BoxShadow(
                    color: pushable == false
                        ? Color(0xFF9A9A9A)
                        : const Color(0xFF94EDFF),
                    //blurRadius: 0,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          //margin: EdgeInsets.only(bottom: deviceH * 0.025),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
