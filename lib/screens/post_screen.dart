import 'dart:io';

import 'package:cocoroiki_app/api_client/api.dart';
import 'package:cocoroiki_app/components/custom_app_bar.dart';

import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/data/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final tags = ['ゆうと'];
  final List<File> images = [];
  var selectedTags = <String>[];

  File? image;
  ImagePicker picker = ImagePicker();

  PostResponse post = PostResponse();
  //PostRequest postPost = PostRequest(data: );
  //IOSのみ許可の記述がいる
  //フォルダから選んだ画像を読みとる
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      // 画像がnullの場合戻る
      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() {
        this.image = imageTemp;
        images.add(imageTemp);
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  // カメラを使う関数
  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      // 画像がnullの場合戻る
      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;

    DateFormat outputFormat = DateFormat('yyyy年MM月dd日');

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: deviceH,
                width: 50,
                decoration: BoxDecoration(color: Color(0xFFE9F9D4)),
              ),
              Container(
                height: deviceH,
                width: 50,
                decoration: BoxDecoration(color: Color(0xFFE9F9D4)),
              ),
              Container(
                height: deviceH,
                width: 50,
                decoration: BoxDecoration(color: Color(0xFFE9F9D4)),
              ),
              Container(
                height: deviceH,
                width: 50,
                decoration: BoxDecoration(color: Color(0xFFE9F9D4)),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  CustomAppBar(reading: 'back_button.svg', title: '新規投稿'),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 52),
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'シェア',
                        style: TextStyle(
                            color: Color(0xFF234FE9),
                            fontFamily: 'Zen-Bl',
                            fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 24,
                      top: 24,
                    ),
                    child: Text(outputFormat.format(DateTime.now()),
                        style: TextStyle(fontSize: 24, color: kFontColor)),
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.only(left: 24.0),
                    child: TextField(
                      //cursorColor: kSelectColor,
                      style: TextStyle(fontSize: 16, color: kFontColor),
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: '今日の出来事を共有しましょう'),
                    ),
                  ),
                  Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 24),
                          images.length == 0
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {
                                        print('タップ');
                                        pickImage();
                                      },
                                      child: Container(
                                          alignment: Alignment.center,
                                          height: 208,
                                          width: 342,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/svg/image_icon.svg'),
                                              Text("写真を1〜4枚追加しましょう",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: kSubFontColor)),
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black26, //色

                                                offset: Offset(0, 2),
                                              ),
                                            ],
                                          )),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                )
                              : images.length == 1
                                  ? Padding(
                                      padding:
                                          const EdgeInsets.only(left: 24.0),
                                      child: Stack(
                                        children: [
                                          Container(
                                            clipBehavior: Clip.antiAlias,
                                            height: 208,
                                            width: 342,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: FittedBox(
                                                fit: BoxFit.cover,
                                                child: Image.file(images[0])),
                                          ),
                                          Positioned(
                                              right: 12,
                                              top: 12,
                                              child: GestureDetector(
                                                onTap: () {
                                                  print(images);
                                                  setState(() {
                                                    images.removeAt(0);
                                                  });
                                                },
                                                child: SvgPicture.asset(
                                                    'assets/svg/image_batsu.svg'),
                                              ))
                                        ],
                                      ),
                                    )
                                  : SizedBox(
                                      height: 208,
                                      width: deviceW,
                                      child: ListView.builder(
                                        itemCount: images.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Stack(
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(width: 8),
                                                  Container(
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    height: 208,
                                                    width: 342,
                                                    decoration:
                                                        const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10),
                                                      ),
                                                    ),
                                                    child: FittedBox(
                                                        fit: BoxFit.cover,
                                                        child: Image.file(
                                                            images[index])),
                                                  ),
                                                ],
                                              ),
                                              Positioned(
                                                  right: 12,
                                                  top: 12,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        images.removeAt(index);
                                                      });
                                                    },
                                                    child: SvgPicture.asset(
                                                        'assets/svg/image_batsu.svg'),
                                                  )),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                          SizedBox(height: 40),
                        ],
                      ),
                      Positioned(
                          bottom: 10,
                          right: 0,
                          child: GestureDetector(
                              onTap: () {
                                pickImage();
                              },
                              child: images.length == 0
                                  ? Container()
                                  : SvgPicture.asset(
                                      'assets/svg/image_add.svg')))
                    ],
                  )
                ],
              ),
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
                      Text("子どもの名前",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
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
                                horizontal: 26, vertical: 12),
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  width: 4,
                                  color: isSelected
                                      ? kSelectColor
                                      : Colors.transparent,
                                ),
                                color:
                                    isSelected ? Colors.white : kNameBoxColor),
                            child: Text(
                              tag,
                              style: TextStyle(
                                color:
                                    isSelected ? Colors.black : kNonSelectColor,
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
        ],
      ),
    );
  }
}
