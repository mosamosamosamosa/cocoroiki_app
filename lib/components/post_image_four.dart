import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/data/database.dart';
import 'package:flutter/material.dart';

class PostImageFour extends StatefulWidget {
  const PostImageFour({super.key});

  @override
  State<PostImageFour> createState() => _PostImageFourState();
}

class _PostImageFourState extends State<PostImageFour> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 22),
        Column(
          children: [
            SizedBox(
                height: 96,
                width: 152,
                child: ClipRRect(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(10)),
                    child: Image.network(posts_list[0].image_url[0]))),
            SizedBox(height: 8),
            SizedBox(
                height: 96,
                width: 152,
                child: ClipRRect(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(10)),
                    child: Image.network(posts_list[0].image_url[0]))),
          ],
        ),
        SizedBox(width: 2),
        Column(
          children: [
            SizedBox(
                height: 96,
                width: 152,
                child: ClipRRect(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(10)),
                    child: Image.network(posts_list[0].image_url[0]))),
            SizedBox(height: 8),
            SizedBox(
                height: 96,
                width: 152,
                child: ClipRRect(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(10)),
                    child: Image.network(posts_list[0].image_url[0]))),
          ],
        ),
      ],
    );
  }
}
