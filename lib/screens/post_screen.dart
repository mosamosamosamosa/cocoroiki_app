import 'dart:convert';
import 'dart:io';

import 'package:cocoroiki_app/api/clients.dart';
import 'package:cocoroiki_app/api_client/api.dart';
import 'package:cocoroiki_app/components/custom_app_bar.dart';

import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/data/database.dart';
import 'package:cocoroiki_app/screens/kid/timelinekids.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final tags = ['ゆうと'];
  //final List<MultipartFile> images = [];

  final List<File> images = [];
  List<String> uploadedImageIds = [];
  //final List<MultipartFile> postimages = [];
  var selectedTags = <String>[];

  //MultipartFile? postimage;
  File? image;
  ImagePicker picker = ImagePicker();
  PostResponse post = PostResponse();

  final controller = TextEditingController();

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      // final postimage = await ImagePicker()
      //     .pickImage(source: ImageSource.gallery) as MultipartFile;

      // 画像がnullの場合戻る
      if (image == null) return;

      final imageTemp = File(image.path);
      //final postimageTemp = MultipartFile(field, stream, length)

      setState(() {
        this.image = imageTemp;
        images.add(imageTemp);
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
  //PostRequest postPost = PostRequest(data: );
  //IOSのみ許可の記述がいる
  //フォルダから選んだ画像を読みとる
  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     final disdayImage =
  //         await ImagePicker().pickImage(source: ImageSource.gallery);
  //     // 画像がnullの場合戻る

  //     if (image == null) return;
  //     if (displayImage == null) return;

  //     final imageTemp = File(image.path) as MultipartFile;
  //     final displayImageTemp = File(displayImage!.path);

  //     setState(() {
  //       this.image = imageTemp;
  //       this.displayImage = displayImageTemp;
  //       images.add(imageTemp);
  //       displayImages.add(displayImageTemp);
  //     });
  //     print(images);
  //   } on PlatformException catch (e) {
  //     print('Failed to pick image: $e');
  //   }
  // }

  // カメラを使う関数
  // Future pickImageC() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.camera);
  //     // 画像がnullの場合戻る
  //     if (image == null) return;

  //     final imageTemp = File(image.path);

  //     setState(() => this.image = imageTemp);
  //   } on PlatformException catch (e) {
  //     print('Failed to pick image: $e');
  //   }
  // }

  // Future postPostData() async {
  //   final apiClient =
  //       ApiClient(basePath: 'https://cocoroiki-bff.yumekiti.net/api');
  //   final apiInstance = PostApi(apiClient);
  //   final apiImgInstance = UploadFileApi(apiClient);
  //   try {
  //     //apiImgInstance.uploadPost(images);
  //     final newPost = PostRequest(
  //         data: PostRequestData(
  //       // user: AppUserRequestDataFamiliesInner(fields: {'id': 1}),
  //       content: controller.text,
  //       // kids: <AppUserRequestDataFamiliesInner>[
  //       //   AppUserRequestDataFamiliesInner(fields: {'id': 2}),
  //       // ],
  //       // images: <AppUserRequestDataFamiliesInner>[
  //       //   AppUserRequestDataFamiliesInner(fields: {'id': 1}),
  //       // ],
  //       //like: 0,
  //       // comments: <AppUserRequestDataFamiliesInner>[
  //       //   AppUserRequestDataFamiliesInner(fields: {'id': null}),
  //       // ]
  //     ));
  //     final response = await apiInstance.postPosts(newPost);
  //     print(response);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  postImageAndPost(String userId, String content, List images) async {
    final formData =
        http.MultipartRequest('POST', Uri.parse('${Clients().url}posts'))
          ..fields['data'] = jsonEncode({
            'user': userId,
            'content': content,
          })
          ..files.addAll(
            images
                .map(
                  (file) => http.MultipartFile.fromBytes(
                    'files.images',
                    file.readAsBytesSync(),
                    filename: file.path.split('/').last,
                  ),
                )
                .toList(),
          );

    try {
      final response = await http.Response.fromStream(await formData.send());

      if (response.statusCode == 200) {
        print('Upload successful');
        // Do something with the response if needed
      } else {
        print('Upload failed');
      }
    } catch (error) {
      print('Error uploading data: $error');
    }
  }

  // postPost(String userId, String content, List images) async {
  //   final url = Uri.parse('${Clients().url}posts');
  //   final headers = <String, String>{
  //     'Content-Type': 'application/json',
  //   };

  //   final body = jsonEncode({
  //     'data': {'user': userId, 'content': content, 'images': images}
  //   });

  //   try {
  //     final response = await http.post(url, headers: headers, body: body);
  //     // Handle the response here
  //     print(response.body);
  //   } catch (error) {
  //     // Handle error here
  //   }
  // }
  postPost(String userId, String content, imageIds) async {
    final url = Uri.parse('${Clients().url}posts');
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      'data': {
        'user': userId,
        'content': content,
        'images': imageIds,
        'kids': 2
      }
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      // Handle the response here
      print(response.body);
    } catch (error) {
      // Handle error here
    }
  }

  uploadImages(List<File> imageFiles) async {
    try {
      final apiUrl = 'http://cocoroiki-strapi.yumekiti.net/api/upload';
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      for (var imageFile in imageFiles) {
        request.files
            .add(await http.MultipartFile.fromPath('files', imageFile.path));
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        // アップロード成功
        print('Images uploaded successfully');
        final responseString = await response.stream.bytesToString();
        final parsedResponse = json.decode(responseString) as List<dynamic>;

        // Strapiから返されるJSONレスポンス形式に合わせて修正
        if (parsedResponse is List) {
          final ids = parsedResponse
              .map<String>((image) => image['id'].toString())
              .toList();
          setState(() {
            uploadedImageIds = List<String>.from(ids);
          });

          // アップロードされた画像のIDを表示
          print('Uploaded Image IDs: $uploadedImageIds');

          await postPost(1.toString(), controller.text, uploadedImageIds);

          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Timelinekids()));
        } else {
          print('Unexpected response format: $parsedResponse');
        }
      } else {
        // アップロード失敗
        print('Images upload failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading images: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;

    DateFormat outputFormat = DateFormat('yyyy年MM月dd日');

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
                width: deviceW,
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image.asset('assets/image/back_check.png'))),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Container(
            //       height: deviceH,
            //       width: 50,
            //       decoration: BoxDecoration(color: Color(0xFFE9F9D4)),
            //     ),
            //     Container(
            //       height: deviceH,
            //       width: 50,
            //       decoration: BoxDecoration(color: Color(0xFFE9F9D4)),
            //     ),
            //     Container(
            //       height: deviceH,
            //       width: 50,
            //       decoration: BoxDecoration(color: Color(0xFFE9F9D4)),
            //     ),
            //     Container(
            //       height: deviceH,
            //       width: 50,
            //       decoration: BoxDecoration(color: Color(0xFFE9F9D4)),
            //     )
            //   ],
            // ),
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
                        onTap: () async {
                          await uploadImages(images);
                        },
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
                    Padding(
                      padding: EdgeInsets.only(left: 24.0),
                      child: SizedBox(
                        width: 580,
                        child: TextField(
                          maxLines: null,
                          //cursorColor: kSelectColor,
                          controller: controller,
                          style: TextStyle(fontSize: 16, color: kFontColor),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '今日の出来事を共有しましょう'),
                        ),
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
                                          itemBuilder: (BuildContext context,
                                              int index) {
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
                                                          images
                                                              .removeAt(index);
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  border: Border.all(
                                    width: 4,
                                    color: isSelected
                                        ? kSelectColor
                                        : Colors.transparent,
                                  ),
                                  color: isSelected
                                      ? Colors.white
                                      : kNameBoxColor),
                              child: Text(
                                tag,
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.black
                                      : kNonSelectColor,
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
      ),
    );
  }
}
