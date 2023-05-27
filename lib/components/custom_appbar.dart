import 'package:cocoroiki_app/constants.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: deviceW,
          height: deviceH * 0.15,
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
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset('assets/image/back_button.png')),
              Text("新規投稿",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(
                "シェア",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ],
    );
  }
}
