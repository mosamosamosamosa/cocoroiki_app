import 'package:cocoroiki_app/constants.dart';
import 'package:flutter/material.dart';

class PostImageThree extends StatefulWidget {
  const PostImageThree({super.key});

  @override
  State<PostImageThree> createState() => _PostImageThreeState();
}

class _PostImageThreeState extends State<PostImageThree> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 16.5),
        Container(
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
        Column(
          children: [
            Container(
                height: 96,
                width: 152,
                decoration: const BoxDecoration(
                  color: kImageBoxColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26, //色

                      offset: Offset(0, 2),
                    ),
                  ],
                )),
            SizedBox(height: 8),
            Container(
                height: 96,
                width: 152,
                decoration: const BoxDecoration(
                  color: kImageBoxColor,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26, //色

                      offset: Offset(0, 2),
                    ),
                  ],
                )),
          ],
        ),
      ],
    );
  }
}
