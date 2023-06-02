import 'package:cocoroiki_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AlbamScreen extends StatefulWidget {
  const AlbamScreen({super.key});

  @override
  State<AlbamScreen> createState() => _AlbamScreenState();
}

class _AlbamScreenState extends State<AlbamScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;

    List<Widget> imageList = [
      Container(width: 120, height: 120, color: kImageBoxColor),
      Container(width: 120, height: 120, color: kImageBoxColor)
    ];
    return Scaffold(
        body: SizedBox(
            height: deviceH * 0.7,
            width: deviceW,
            child: GridView.count(
                //childAspectRatio: 1.2,
                mainAxisSpacing: 7,
                crossAxisSpacing: 7,
                crossAxisCount: 3,
                children: List.generate(
                    11,
                    (index) => Container(
                          width: 125,
                          height: 125,
                          color: kImageBoxColor,
                        )))));
  }
}
