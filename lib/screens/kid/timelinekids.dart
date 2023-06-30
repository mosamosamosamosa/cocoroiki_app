import 'package:cocoroiki_app/api/posts.dart';
import 'package:cocoroiki_app/components/custom_app_bar.dart';
import 'package:cocoroiki_app/components/custom_appbar.dart';
import 'package:cocoroiki_app/components/custom_appbar2.dart';
import 'package:cocoroiki_app/components/post.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/data/database.dart';
import 'package:cocoroiki_app/screens/grandparent/timeline/menu_modal.dart';

import 'package:cocoroiki_app/screens/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class Timelinekids extends StatefulWidget {
  const Timelinekids({super.key, required this.parent});

  final bool parent;

  @override
  State<Timelinekids> createState() => _TimelinekidsState();
}

class _TimelinekidsState extends State<Timelinekids> {
  //var posts;

  // @override
  // void initState() {
  //   Posts().getPosts().then((value) => {
  //         setState(() {
  //           if (value == null || value == 0) {
  //             posts = 0;
  //           } else {
  //             posts = value;
  //           }
  //         }),
  //       });

  //   super.initState();
  //   print("入れたもの：$posts");
  // }

  Widget build(BuildContext context) {
    DateFormat outputFormat = DateFormat('yyyy年MM月dd日 H:m');
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: deviceH,
                        width: 50,
                        decoration: BoxDecoration(color: Color(0xFFE9F9D4)),
                      ),
                      Container(
                        height: deviceH,
                        width: 50,
                        decoration: BoxDecoration(color: Color(0xFFE9F9D4)),
                      ),
                      Container(
                        height: deviceH,
                        width: 50,
                        decoration: BoxDecoration(color: Color(0xFFE9F9D4)),
                      ),
                      Container(
                        height: deviceH,
                        width: 50,
                        decoration: BoxDecoration(color: Color(0xFFE9F9D4)),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                          height: deviceH,
                          width: deviceW,
                          child: ListView.builder(
                              padding: EdgeInsets.only(
                                  top: deviceH * 0.18, bottom: deviceH * 0.06),
                              itemCount: 5,
                              //shrinkWrap: true,
                              itemBuilder: ((BuildContext context, index) {
                                return Column(
                                  children: [
                                    Post(
                                      content: 'おばあちゃんとあそんだよ！',
                                      kidName: 'ゆうと',
                                      imageList: posts_list[0].image_url,
                                      postUser: 'ともこ',
                                      parent: false,
                                    ),
                                    SizedBox(height: 21)
                                  ],
                                );
                              }))),
                    ],
                  ),
                  // Positioned(
                  //   bottom: 0,
                  //   child: Container(
                  //     height: deviceH * 0.315,
                  //     width: deviceW,
                  //     decoration:
                  //         BoxDecoration(color: Colors.white.withOpacity(0.9)),
                  //   ),
                  // ),
                  CustomAppBar(title: 'タイムライン', reading: 'humberger.svg'),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: widget.parent
            ? FloatingActionButton(
                elevation: 0,
                backgroundColor: Color(0xFFFCCC00),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PostScreen()));
                },
                child: const Icon(Icons.add, color: Colors.white))
            : GestureDetector(
                onTap: () {
                  showDialog(
                      barrierColor: Colors.black.withOpacity(0.8),
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) => MenuModal());
                },
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SvgPicture.asset('assets/svg/menu_button.svg'),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            'メニュー',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Zen-B',
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 4.5
                                ..color = kshadoeColor,
                            ),
                          ),
                          Text(
                            'メニュー',
                            style: TextStyle(
                              fontFamily: 'Zen-B',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
  }
}
