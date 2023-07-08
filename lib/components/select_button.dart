import 'package:cocoroiki_app/constants.dart';
import 'package:flutter/material.dart';

class SelectedButton extends StatefulWidget {
  const SelectedButton({super.key, required this.text, required this.pushed});

  final String text;
  final bool pushed;

  @override
  State<SelectedButton> createState() => _SelectedButtonState();
}

class _SelectedButtonState extends State<SelectedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: 150,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Zen-B',
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 4.5
                  ..color = kshadoeColor,
              ),
            ),
            Text(
              widget.text,
              style: TextStyle(
                fontFamily: 'Zen-B',
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: widget.pushed ? Color(0xFFFF7020) : Color(0xFFCFCFCF),
              width: 7),
          boxShadow: [
            // ボタン下
            BoxShadow(
              color: Color(0xFF650303),
              offset: Offset(0, 4),
            ),

            // ボタン上
            BoxShadow(
              color: widget.pushed ? Color(0xFFFFB72B) : Colors.white,
              //blurRadius: 0,
              offset: Offset(0, 0),
            ),
          ],
        ));
  }
}
