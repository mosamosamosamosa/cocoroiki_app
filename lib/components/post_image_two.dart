import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/data/database.dart';
import 'package:flutter/material.dart';

class PostImageTwo extends StatefulWidget {
  const PostImageTwo({super.key});

  @override
  State<PostImageTwo> createState() => _PostImageTwoState();
}

class _PostImageTwoState extends State<PostImageTwo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 16.5),
        Container(
          clipBehavior: Clip.antiAlias,
          height: 200,
          width: 152,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
          ),
          child: FittedBox(
              fit: BoxFit.cover,
              child: Image.network(posts_list[0].image_url[0])),
        ),
        SizedBox(width: 8),
        Container(
          clipBehavior: Clip.antiAlias,
          height: 200,
          width: 152,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
            ),
          ),
          child: FittedBox(
              fit: BoxFit.cover,
              child: Image.network(posts_list[0].image_url[0])),
        ),
      ],
    );
  }
}
