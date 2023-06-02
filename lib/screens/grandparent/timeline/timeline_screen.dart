import 'package:cocoroiki_app/components/post.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/screens/grandparent/timeline/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({super.key});

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  @override
  Widget build(BuildContext context) {
    DateFormat outputFormat = DateFormat('yyyy年MM月dd日 H:m');
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SizedBox(
          height: deviceH,
          width: deviceW,
          child: ListView.builder(
              padding: EdgeInsets.only(top: deviceH * 0.03),
              itemCount: 3,
              //shrinkWrap: true,
              itemBuilder: ((BuildContext context, index) {
                return Column(
                  children: [Post(), SizedBox(height: 21)],
                );
              }))),
      floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: kPostButtonColor,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PostScreen()));
          },
          child: const Icon(Icons.add, color: Colors.black)),
    );
  }
}
