import 'package:cocoroiki_app/constants.dart';
import 'package:flutter/material.dart';

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
        Padding(
          padding: const EdgeInsets.only(bottom: 13),
          child: Text("タイムライン",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        )
      ],
    );
  }
}
