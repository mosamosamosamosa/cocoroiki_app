import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/data/database.dart';
import 'package:cocoroiki_app/screens/image_modal.dart';
import 'package:flutter/material.dart';

class PostImageFour extends StatefulWidget {
  const PostImageFour({super.key, required this.myPost});

  final bool myPost;

  @override
  State<PostImageFour> createState() => _PostImageFourState();
}

class _PostImageFourState extends State<PostImageFour> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
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
                height: widget.myPost ? 104 : 96,
                width: widget.myPost ? 170 : 152,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                  ),
                ),
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.network(posts_list[0].image_url[0])),
              ),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                showDialog(
                    barrierColor: Colors.black.withOpacity(0.8),
                    context: context,
                    builder: (BuildContext context) => ImageModal(
                        image: posts_list[0].image_url[1], activeIndex: 1));
              },
              child: Container(
                clipBehavior: Clip.antiAlias,
                height: widget.myPost ? 104 : 96,
                width: widget.myPost ? 170 : 152,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.network(posts_list[0].image_url[1])),
              ),
            ),
          ],
        ),
        SizedBox(width: 8),
        Column(
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                    barrierColor: Colors.black.withOpacity(0.8),
                    context: context,
                    builder: (BuildContext context) => ImageModal(
                          image: posts_list[0].image_url[2],
                          activeIndex: 2,
                        ));
              },
              child: Container(
                clipBehavior: Clip.antiAlias,
                height: widget.myPost ? 104 : 96,
                width: widget.myPost ? 170 : 152,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                  ),
                ),
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.network(posts_list[0].image_url[2])),
              ),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                showDialog(
                    barrierColor: Colors.black.withOpacity(0.8),
                    context: context,
                    builder: (BuildContext context) => ImageModal(
                          image: posts_list[0].image_url[3],
                          activeIndex: 3,
                        ));
              },
              child: Container(
                clipBehavior: Clip.antiAlias,
                height: widget.myPost ? 104 : 96,
                width: widget.myPost ? 170 : 152,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.network(posts_list[0].image_url[3])),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
