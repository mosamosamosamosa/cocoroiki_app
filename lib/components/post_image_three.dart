import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/data/database.dart';
import 'package:cocoroiki_app/screens/image_modal.dart';
import 'package:flutter/material.dart';

class PostImageThree extends StatefulWidget {
  const PostImageThree({super.key});

  @override
  State<PostImageThree> createState() => _PostImageThreeState();
}

class _PostImageThreeState extends State<PostImageThree> {
  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    return Row(
      children: [
        SizedBox(width: 20),
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
        Column(
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                    barrierColor: Colors.black.withOpacity(0.8),
                    context: context,
                    builder: (BuildContext context) => ImageModal(
                          image: posts_list[0].image_url[1],
                          activeIndex: 1,
                        ));
              },
              child: Container(
                clipBehavior: Clip.antiAlias,
                height: 96,
                width: 152,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                  ),
                ),
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.network(posts_list[0].image_url[1])),
              ),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                showDialog(
                    barrierColor: Colors.black.withOpacity(0.8),
                    context: context,
                    builder: (BuildContext context) => ImageModal(
                          image: posts_list[0].image_url[0],
                          activeIndex: 2,
                        ));
              },
              child: Container(
                clipBehavior: Clip.antiAlias,
                height: 96,
                width: 152,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(10)),
                ),
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.network(posts_list[0].image_url[0])),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
