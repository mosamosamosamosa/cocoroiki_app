import 'package:flutter/material.dart';

class SubAppButton extends StatelessWidget {
  const SubAppButton({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      height: 60,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Zen-M',
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 5
                ..color = Color(0xFF835237),
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          // ボタン下
          BoxShadow(color: Color(0xFF650303), offset: Offset(0, 4)),

          // ボタン上
          BoxShadow(
            color: Color(0xFFFCCC00),
            //blurRadius: 0,
            offset: Offset(0, 0),
          ),
        ],
      ),
    );
  }
}
