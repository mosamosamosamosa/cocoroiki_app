import 'package:cocoroiki_app/components/post_image_four.dart';
import 'package:cocoroiki_app/components/post_image_one.dart';
import 'package:cocoroiki_app/components/post_image_three.dart';
import 'package:cocoroiki_app/components/post_image_two.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/data/database.dart';
import 'package:cocoroiki_app/data/database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    DateFormat outputFormat = DateFormat('yyyy年MM月dd日 H:m');
    Widget post;
    int imageNum = posts_list[0].image_url.length;
    if (imageNum == 1) {
      post = PostImageOne();
    } else if (imageNum == 2) {
      post = PostImageTwo();
    } else if (imageNum == 3) {
      post = PostImageThree();
    } else {
      post = PostImageFour();
    }

    return Container(
      width: 354,
      //height: ,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12, //色
            spreadRadius: 0.5,
            blurRadius: 5,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 16,
            right: 16,
            child: Text(
              outputFormat.format(posts_list[0].created_at),
              style: TextStyle(color: kDateColor),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 28, left: 16),
                child: Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: CircleAvatar(
                          radius: 32,
                          foregroundImage: NetworkImage(users_list[0].image)),
                    ),
                    // Container(
                    //   alignment: Alignment.center,
                    //   width: 60,
                    //   height: 60,
                    //   child: Text("写真"),
                    //   decoration: const BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     color: kImageBoxColor,
                    //   ),
                    // ),
                    SizedBox(width: 8),
                    Text(posts_list[0].username,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: kFontColor))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 16, right: 20),
                child: Text(posts_list[0].content,
                    style: TextStyle(color: kFontColor, fontSize: 16)),
              ),
              SizedBox(height: 16),
              post,
              SizedBox(height: 60),
            ],
          ),
        ],
      ),
    );
  }
}
