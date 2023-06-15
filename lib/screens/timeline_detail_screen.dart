import 'package:cocoroiki_app/components/custom_app_bar.dart';
import 'package:cocoroiki_app/components/favorite_button.dart';
import 'package:cocoroiki_app/components/post_image_four.dart';
import 'package:cocoroiki_app/components/post_image_one.dart';
import 'package:cocoroiki_app/components/post_image_three.dart';
import 'package:cocoroiki_app/components/post_image_two.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/data/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class TimelineDetailScreen extends StatefulWidget {
  const TimelineDetailScreen({super.key});

  @override
  State<TimelineDetailScreen> createState() => _TimelineDetailScreenState();
}

class _TimelineDetailScreenState extends State<TimelineDetailScreen> {
  @override
  Widget build(BuildContext context) {
    DateFormat outputFormat = DateFormat('yyyy年MM月dd日');
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    Widget post;
    int imageNum = posts_list[0].image_url.length;
    if (imageNum == 1) {
      post = PostImageOne(myPost: true);
    } else if (imageNum == 2) {
      post = PostImageTwo(myPost: true);
    } else if (imageNum == 3) {
      post = PostImageThree(myPost: true);
    } else {
      post = PostImageFour(myPost: true);
    }

    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: deviceH * 0.16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28, top: 23),
                  child: Text(
                    outputFormat.format(posts_list[0].created_at),
                    style: TextStyle(
                        color: Color(0xFF919191),
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28, top: 16),
                  child: Text(posts_list[0].content,
                      style: TextStyle(color: kFontColor, fontSize: 16)),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [SizedBox(width: 10), post, SizedBox(width: 10)],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 21),
                    Row(
                      children: [
                        //FavoriteButton(),
                        SvgPicture.asset('assets/svg/favorite.svg'),
                        Text('1'),
                      ],
                    ),
                    SizedBox(width: 32),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svg/comment.svg'),
                        Text('1')
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 178),
                      child: Container(
                        alignment: Alignment.center,
                        height: 32,
                        width: 70,
                        child: Text('ゆうと',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: kFontColor)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey, //色
                              spreadRadius: 0.1,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Divider(
                      color: kBorderColor,
                      thickness: 0.5,
                      indent: 18,
                      endIndent: 18),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 40,
                          width: 40,
                          child: CircleAvatar(
                              radius: 32,
                              foregroundImage:
                                  NetworkImage(users_list[0].image))),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(posts_list[0].username,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: kFontColor)),
                              SizedBox(width: 16),
                              Text(
                                '12分前',
                                style: TextStyle(
                                    color: Color(0xFF919191), fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 294,
                            child: Text(
                              '孫ちゃん！元気にしてるかな？ おばあちゃんはいつも孫ちゃんのことを思ってるよ。最近何して遊んでるのかな？おばあちゃんはお花を育てたり、 おしゃべりしたりして楽しんでるよ。また会える日が楽しみだね。おばあちゃんはいつも孫ちゃんの味方だから、 困ったことがあったらいつでも話してね。大好きだよ、孫ちゃん！',
                              style: TextStyle(fontSize: 14, color: kFontColor),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 40,
                          width: 40,
                          child: CircleAvatar(
                              radius: 32,
                              foregroundImage:
                                  NetworkImage(users_list[0].image))),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(posts_list[0].username,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: kFontColor)),
                              SizedBox(width: 16),
                              Text(
                                '12分前',
                                style: TextStyle(
                                    color: Color(0xFF919191), fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 294,
                            child: Text(
                              '孫ちゃん！元気にしてるかな？ おばあちゃんはいつも孫ちゃんのことを思ってるよ。最近何して遊んでるのかな？おばあちゃんはお花を育てたり、 おしゃべりしたりして楽しんでるよ。また会える日が楽しみだね。おばあちゃんはいつも孫ちゃんの味方だから、 困ったことがあったらいつでも話してね。大好きだよ、孫ちゃん！',
                              style: TextStyle(fontSize: 14, color: kFontColor),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        CustomAppBar(
          title: '${users_list[0].name}の投稿',
          reading: 'back_button.svg',
        ),
      ],
    ));
  }
}
