import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/data/database.dart';
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
        SizedBox(
          height: 200,
          width: 152,
          child: FittedBox(
            fit: BoxFit.cover,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                child: SizedBox(
                    width: 152,
                    child: Image.network(posts_list[0].image_url[0]))),
          ),
        ),
        SizedBox(width: 8),
        Column(
          children: [
            SizedBox(
              height: 96,
              width: 152,
              child: FittedBox(
                fit: BoxFit.fill,
                child: ClipRRect(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(10)),
                    child: SizedBox(
                        width: 152,
                        child: Image.network(posts_list[0].image_url[0]))),
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 96,
              width: 152,
              child: FittedBox(
                fit: BoxFit.fill,
                child: ClipRRect(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(10)),
                    child: SizedBox(
                        width: 152,
                        child: Image.network(posts_list[0].image_url[0]))),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
