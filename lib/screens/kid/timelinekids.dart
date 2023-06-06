import 'package:cocoroiki_app/components/custom_appbar.dart';
import 'package:cocoroiki_app/components/custom_appbar2.dart';
import 'package:cocoroiki_app/components/post.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/screens/grandparent/timeline/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class Timelinekids extends StatefulWidget {
  const Timelinekids({super.key});

  @override
  State<Timelinekids> createState() => _TimelinekidsState();
}

class _TimelinekidsState extends State<Timelinekids> {
  @override
  Widget build(BuildContext context) {
    DateFormat outputFormat = DateFormat('yyyy年MM月dd日 H:m');
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppbar2(),
            Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
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
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: deviceH * 0.315,
                    width: deviceW,
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.9)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //     elevation: 0,
      //     backgroundColor: kPostButtonColor,
      //     onPressed: () {
      //       Navigator.push(context,
      //           MaterialPageRoute(builder: (context) => const PostScreen()));
      //     },
      //     child: const Icon(Icons.add, color: Colors.black)),
    );
  }
}
