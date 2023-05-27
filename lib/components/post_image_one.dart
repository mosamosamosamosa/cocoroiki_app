import 'package:cocoroiki_app/constants.dart';
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
