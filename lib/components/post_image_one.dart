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
      clipBehavior: Clip.antiAlias,
      height: 200,
      width: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
        ),
      ),
      child: FittedBox(
          fit: BoxFit.cover, child: Image.network(posts_list[0].image_url[0])),
    );
  }
}
