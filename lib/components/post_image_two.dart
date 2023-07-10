import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/data/database.dart';
import 'package:cocoroiki_app/screens/image_modal.dart';
import 'package:flutter/material.dart';

class PostImageTwo extends StatefulWidget {
  const PostImageTwo(
      {super.key, required this.myPost, required this.imageList});
  final bool myPost;
  final List<String> imageList;

  @override
  State<PostImageTwo> createState() => _PostImageTwoState();
}

class _PostImageTwoState extends State<PostImageTwo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
                barrierColor: Colors.black.withOpacity(0.8),
                context: context,
                builder: (BuildContext context) => ImageModal(
                      image: widget.imageList[0],
                      activeIndex: 0,
                      imageList: widget.imageList,
                    ));
          },
          child: Container(
            clipBehavior: Clip.antiAlias,
            height: widget.myPost ? 216 : 200,
            width: widget.myPost ? 170 : 152,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
            ),
            child: FittedBox(
                fit: BoxFit.cover, child: Image.network(widget.imageList[0])),
          ),
        ),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            showDialog(
                barrierColor: Colors.black.withOpacity(0.8),
                context: context,
                builder: (BuildContext context) => ImageModal(
                      image: widget.imageList[1],
                      activeIndex: 1,
                      imageList: widget.imageList,
                    ));
          },
          child: Container(
            clipBehavior: Clip.antiAlias,
            height: widget.myPost ? 216 : 200,
            width: widget.myPost ? 170 : 152,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: FittedBox(
                fit: BoxFit.cover, child: Image.network(widget.imageList[1])),
          ),
        ),
      ],
    );
  }
}
