import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/data/database.dart';
import 'package:cocoroiki_app/screens/image_modal.dart';
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
        GestureDetector(
          onTap: () {
            showDialog(
                barrierColor: Colors.black.withOpacity(0.8),
                context: context,
                builder: (BuildContext context) => ImageModal(
                      image: posts_list[0].image_url[0],
                      activeIndex: 0,
                    ));
          },
          child: Container(
            clipBehavior: Clip.antiAlias,
            height: 200,
            width: 152,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
            ),
            child: FittedBox(
                fit: BoxFit.cover,
                child: Image.network(posts_list[0].image_url[0])),
          ),
        ),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            showDialog(
                barrierColor: Colors.black.withOpacity(0.8),
                context: context,
                builder: (BuildContext context) => ImageModal(
                      image: posts_list[0].image_url[0],
                      activeIndex: 1,
                    ));
          },
          child: Container(
            clipBehavior: Clip.antiAlias,
            height: 200,
            width: 152,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: FittedBox(
                fit: BoxFit.cover,
                child: Image.network(posts_list[0].image_url[0])),
          ),
        ),
      ],
    );
  }
}
