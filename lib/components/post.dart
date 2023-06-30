import 'package:cocoroiki_app/components/favorite_button.dart';
import 'package:cocoroiki_app/components/post_image_four.dart';
import 'package:cocoroiki_app/components/post_image_one.dart';
import 'package:cocoroiki_app/components/post_image_three.dart';
import 'package:cocoroiki_app/components/post_image_two.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/data/database.dart';
import 'package:cocoroiki_app/data/database.dart';
import 'package:cocoroiki_app/screens/timeline_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class Post extends StatefulWidget {
  const Post(
      {super.key,
      required this.imageList,
      required this.kidName,
      required this.content,
      required this.postUser,
      required this.parent});

  final List<String> imageList;
  final String kidName;
  final String content;
  final String postUser;
  final bool parent;

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    DateFormat outputFormat = DateFormat('yyyy年MM月dd日 H:m');
    Widget post;
    int imageNum = widget.imageList.length;
    if (imageNum == 1) {
      post = PostImageOne(myPost: false);
    } else if (imageNum == 2) {
      post = PostImageTwo(myPost: false);
    } else if (imageNum == 3) {
      post = PostImageThree(myPost: false);
    } else {
      post = PostImageFour(myPost: false);
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TimelineDetailScreen()));
      },
      child: Container(
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
                    )
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
            Positioned(
              bottom: 18,
              right: 24,
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
      ),
    );
  }
}
