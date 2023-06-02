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
            child: Image.network(posts_list[0].image_url[0]),
            height: 200,
            width: 152,
            decoration: const BoxDecoration(
              color: kImageBoxColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26, //色

                  offset: Offset(0, 2),
                ),
              ],
            )),
        SizedBox(width: 8),
        Container(
            child: Image.network(posts_list[0].image_url[0]),
            height: 200,
            width: 152,
            decoration: const BoxDecoration(
              color: kImageBoxColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26, //色

                  offset: Offset(0, 2),
                ),
              ],
            )),
      ],
    );
  }
}
