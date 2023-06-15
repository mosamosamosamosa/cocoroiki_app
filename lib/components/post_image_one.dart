import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/data/database.dart';
import 'package:cocoroiki_app/screens/image_modal.dart';
import 'package:flutter/material.dart';

class PostImageOne extends StatefulWidget {
  const PostImageOne({super.key, required this.myPost});

  final bool myPost;

  @override
  State<PostImageOne> createState() => _PostImageOneState();
}

class _PostImageOneState extends State<PostImageOne> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
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
          height: widget.myPost ? 216 : 200,
          width: widget.myPost ? 342 : 300,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: FittedBox(
              fit: BoxFit.cover,
              child: Image.network(posts_list[0].image_url[0])),
        ),
      ),
    );
  }
}
