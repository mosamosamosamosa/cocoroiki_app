import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/data/database.dart';
import 'package:flutter/material.dart';

class PostImageOne extends StatefulWidget {
  const PostImageOne({super.key});

  @override
  State<PostImageOne> createState() => _PostImageOneState();
}

class _PostImageOneState extends State<PostImageOne> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ClipRect(child: Image.network(posts_list[0].image_url[0])),
        height: 200,
        width: 300,
        decoration: BoxDecoration(
          color: kImageBoxColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26, //色

              offset: Offset(0, 2),
            ),
          ],
        ));
  }
}
