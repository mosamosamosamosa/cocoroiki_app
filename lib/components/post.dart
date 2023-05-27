import 'package:cocoroiki_app/components/post_image_four.dart';
import 'package:cocoroiki_app/components/post_image_one.dart';
import 'package:cocoroiki_app/components/post_image_three.dart';
import 'package:cocoroiki_app/components/post_image_two.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    Widget post;
    int imageNum = 4;
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
      height: 455,
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
              "2023年5月23日",
              style: TextStyle(color: kDateColor),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 28, left: 16),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 60,
                      height: 60,
                      child: Text("写真"),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kImageBoxColor,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text("朋子 (母名前)",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: kFontColor))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
                child: Text("投稿文入ります投稿文入ります投稿文入ります投稿文入ります投稿文入ります投稿文入ります投稿文入ります",
                    style: TextStyle(color: kFontColor, fontSize: 16)),
              ),
              SizedBox(height: 18),
              post,
            ],
          ),
        ],
      ),
    );
  }
}
