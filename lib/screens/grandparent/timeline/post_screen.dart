import 'package:cocoroiki_app/components/custom_appbar.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/data/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final tags = ['まもる', 'かおり', 'ゆうた'];
  var selectedTags = <String>[];

  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppbar(),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 24,
                  ),
                  child: Text("2023年5月23日",
                      style: TextStyle(
                        fontSize: 24,
                      )),
                ),
                SizedBox(height: 16),
                Text("今日の出来事を共有しましょう",
                    style: TextStyle(fontSize: 16, color: kSubFontColor)),
                SizedBox(height: 24),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                        height: 208,
                        width: 342,
                        decoration: BoxDecoration(
                          color: kImageBoxColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26, //色

                              offset: Offset(0, 2),
                            ),
                          ],
                        )),
                    Text("写真を1〜4枚追加しましょう",
                        style: TextStyle(fontSize: 14, color: kSubFontColor)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Divider(
            color: kBorderColor,
            thickness: 0.5,
            /*height: 80,
            indent: 20,
            endIndent: 20*/
          ),
          SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 24),
                  Text("こどもの名前",
                      style: TextStyle(
                        fontSize: 14,
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18, left: 24),
                child: Wrap(
                  runSpacing: 16,
                  spacing: 10,
                  children: tags.map((tag) {
                    // selectedTags の中に自分がいるかを確かめる
                    final isSelected = selectedTags.contains(tag);
                    return InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      onTap: () {
                        if (isSelected) {
                          // すでに選択されていれば取り除く
                          selectedTags.remove(tag);
                        } else {
                          // 選択されていなければ追加する
                          selectedTags.add(tag);
                        }
                        setState(() {});
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 6),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              width: 2,
                              color: isSelected
                                  ? kSelectColor
                                  : Colors.transparent,
                            ),
                            color: kNameBoxColor),
                        child: Text(
                          tag,
                          style: TextStyle(
                            color: isSelected ? Colors.black : kNonSelectColor,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          Divider(
            color: kBorderColor,
            thickness: 0.5,
            height: 28,
            /*indent: 20,
            endIndent: 20*/
          ),
        ],
      ),
    );
  }
}
