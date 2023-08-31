import 'package:cocoroiki_app/api_client/api.dart';
import 'package:cocoroiki_app/components/favorite_button.dart';
import 'package:cocoroiki_app/components/post_image_four.dart';
import 'package:cocoroiki_app/components/post_image_one.dart';
import 'package:cocoroiki_app/components/post_image_three.dart';
import 'package:cocoroiki_app/components/post_image_two.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/data/database.dart';
import 'package:cocoroiki_app/data/database.dart';
import 'package:cocoroiki_app/provider/provider.dart';
import 'package:cocoroiki_app/screens/timeline_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PostComp extends ConsumerStatefulWidget {
  PostComp({
    super.key,
    required this.postId,
    required this.imageNum,
    required this.kidName,
    required this.content,
    required this.postUser,
    required this.parent,
    required this.createdTime,
    required this.like,
    required this.likeme,
    required this.postNumber,
    this.commentId,
  });

  final int imageNum;
  final String? kidName;
  final String? content;
  final String? postUser;
  final bool parent;
  final DateTime? createdTime;
  final num? postId;
  final int? like;
  final bool likeme;
  final int postNumber;
  final num? commentId;

  @override
  _PostCompState createState() => _PostCompState();
}

class _PostCompState extends ConsumerState<PostComp> {
  PostResponse? postDetail = PostResponse();
  PostResponse putreturnPost = PostResponse();
  List<String> imageList = [];
  Widget post = Container();
  bool grandlike = true;
  bool like = false;
  int? likeNum = 0;
  bool commentme = false;
  bool newLike = false;
  //bool visible = false;

  @override
  void initState() {
    fetchSomeData().then((value) {
      setState(() {
        print('きたああああああああああああああああああああ:${widget.likeme}');
        newLike = widget.likeme;

        if (widget.commentId != null) {
          getCommentId(widget.commentId!);
        }

        likeNum = widget.like;
        if (widget.imageNum == 1) {
          post = PostImageOne(myPost: false, imageList: imageList);
        } else if (widget.imageNum == 2) {
          post = PostImageTwo(myPost: false, imageList: imageList);
        } else if (widget.imageNum == 3) {
          post = PostImageThree(myPost: false, imageList: imageList);
        } else {
          post = PostImageFour(myPost: false, imageList: imageList);
        }
      });
    });

    super.initState();
  }

  Future getCommentId(num id) async {
    final userIdState = ref.watch(userIdProvider);
    print('コメントちるぞ＝');
    final apiClient =
        ApiClient(basePath: 'https://cocoroiki-bff.yumekiti.net/api');
    final apiInstance = CommentApi(apiClient);
    try {
      final response = await apiInstance.getCommentsId(id);

      if (response != null) {
        if (response.data?.attributes?.user?.data?.id == userIdState) {
          setState(() {
            commentme = true;
          });
        }
      }
      //setState(() => {posts = response});
    } catch (e) {
      print(e);
    }
  }

  Future fetchSomeData() async {
    final apiClient =
        ApiClient(basePath: 'https://cocoroiki-bff.yumekiti.net/api');
    final apiInstance = PostApi(apiClient);
    try {
      final response = await apiInstance.getPostsId(widget.postId!);

      print('帰ってきた値:$response');
      if (response != null) {
        setState(() {
          postDetail = response;
          for (int i = 0; i < widget.imageNum; i++) {
            imageList.add(
                'https://cocoroiki-bff.yumekiti.net${(response.data?.attributes?.images?.data[i].attributes?.url).toString()}');
          }
        });
      }
      //setState(() => {posts = response});

      print('imageList : $imageList');
    } catch (e) {
      print(e);
    }
  }

  Future putPostData(num id) async {
    // print('こっちきてると');
    // final apiClient =
    //     ApiClient(basePath: 'https://cocoroiki-bff.yumekiti.net/api');
    // final apiInstance = PostApi(apiClient);
    // //final apiImgInstance = UploadFileApi(apiClient);
    // try {
    //   //apiImgInstance.uploadPost(images);
    //   final newPost = PostRequest(
    //       data: PostRequestData(
    //     user: AppUserRequestDataFamiliesInner(fields: {'id': 1}),
    //     content: widget.content,
    //     kids: <AppUserRequestDataFamiliesInner>[
    //       AppUserRequestDataFamiliesInner(fields: {'id': 2}),
    //     ],
    //     images: <AppUserRequestDataFamiliesInner>[
    //       AppUserRequestDataFamiliesInner(fields: {'id': 1}),
    //     ],
    //     appUsers: <AppUserRequestDataFamiliesInner>[
    //       AppUserRequestDataFamiliesInner(fields: {'id': id}),
    //     ],
    //     // comments: <AppUserRequestDataFamiliesInner>[
    //     //   AppUserRequestDataFamiliesInner(fields: {'id': null}),
    //     // ]
    //   ));
    //   final response = await apiInstance.putPostsId(widget.postId!, newPost);
    //   print(response);
    try {
      final url =
          'https://cocoroiki-bff.yumekiti.net/api/posts/${widget.postId!}';
      final headers = {'Content-Type': 'application/json'};
      final response = await http.get(Uri.parse(url));
      final appUsers =
          jsonDecode(response.body)['data']['attributes']['app_users']['data'];
      appUsers.add(id);
      final data = {
        'data': {'app_users': appUsers}
      };

      await http.put(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(data),
      );
    } catch (e) {
      print('こっちに来ちゃってる');
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userRoleState = ref.watch(userRoleProvider);
    DateFormat outputFormat = DateFormat('yyyy年MM月dd日');

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TimelineDetailScreen(
                      postId: widget.postId!,
                      imageNum: widget.imageNum,
                      imageList: imageList,
                      like: (widget.like)!,
                      likeme: widget.likeme,
                      commentId: widget.commentId,
                    )));
      },
      child: Container(
        width: 354,
        //height: ,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12, //色
              spreadRadius: 0.5,
              blurRadius: 5,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 16,
              right: 16,
              child: Text(
                outputFormat.format(widget.createdTime!),
                style: TextStyle(color: kDateColor),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 28, left: 16),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: CircleAvatar(
                            radius: 32,
                            foregroundImage: NetworkImage(users_list[0].image)),
                      ),
                      // Container(
                      //   alignment: Alignment.center,
                      //   width: 60,
                      //   height: 60,
                      //   child: Text("写真"),
                      //   decoration: const BoxDecoration(
                      //     shape: BoxShape.circle,
                      //     color: kImageBoxColor,
                      //   ),
                      // ),
                      SizedBox(width: 8),
                      Text(widget.postUser!,
                          style: userRoleState
                              ? TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: kFontColor)
                              : TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: kFontColor))
                    ],
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(top: 12, left: 24, right: 20),
                    child: Text(widget.content!,
                        textAlign: TextAlign.left,
                        style: userRoleState
                            ? TextStyle(
                                color: kFontColor,
                                fontSize: 20,
                              )
                            : TextStyle(color: kFontColor, fontSize: 16))),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [SizedBox(width: 10), post, SizedBox(width: 10)],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 21),
                    Row(
                      children: [
                        userRoleState
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    putPostData(3).then(((value) {}));
                                    newLike = true;
                                    ;
                                  });
                                },
                                child: widget.likeme || newLike
                                    ? SvgPicture.asset(
                                        'assets/svg/pink_like_grand.svg')
                                    : SvgPicture.asset(
                                        'assets/svg/like_grand.svg'))
                            : GestureDetector(
                                onTap: () {
                                  putPostData(1);
                                  setState(() {
                                    newLike = true;
                                  });
                                },
                                child: widget.likeme || newLike
                                    ? SvgPicture.asset(
                                        'assets/svg/pink_like.svg')
                                    : SvgPicture.asset('assets/svg/like.svg')),
                        //SizedBox(width: 4),
                        postDetail?.data?.attributes?.appUsers?.data.length ==
                                    null ||
                                postDetail?.data?.attributes?.appUsers?.data
                                        .length ==
                                    0
                            ? Row(
                                children: [
                                  SizedBox(width: 10),
                                  Container(),
                                ],
                              )
                            : Row(
                                children: [
                                  SizedBox(width: 4),
                                  Text(
                                    likeNum.toString(),
                                    style: TextStyle(
                                        color: Color(0xFF949494),
                                        fontWeight: FontWeight.bold,
                                        fontSize: userRoleState ? 20 : 16),
                                  ),
                                ],
                              ),
                      ],
                    ),
                    SizedBox(width: 28),
                    Row(
                      children: [
                        userRoleState
                            ? commentme
                                ? SvgPicture.asset(
                                    'assets/svg/orange_comment_grand.svg')
                                : SvgPicture.asset(
                                    'assets/svg/comment_grand.svg')
                            : commentme
                                ? SvgPicture.asset(
                                    'assets/svg/orange_comment.svg')
                                : SvgPicture.asset('assets/svg/comment.svg'),
                        postDetail?.data?.attributes?.comments?.data.length == 0
                            ? Row(
                                children: [
                                  SizedBox(width: 10),
                                  Container(),
                                ],
                              )
                            : Row(
                                children: [
                                  SizedBox(width: 4),
                                  Text(
                                    (postDetail?.data?.attributes?.comments
                                            ?.data.length)
                                        .toString(),
                                    style: TextStyle(
                                        color: Color(0xFF949494),
                                        fontWeight: FontWeight.bold,
                                        fontSize: userRoleState ? 20 : 16),
                                  ),
                                ],
                              )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
            Positioned(
              bottom: 18,
              right: 24,
              child: Container(
                alignment: Alignment.center,
                height: 32,
                width: 70,
                child: Text(widget.kidName!,
                    style: userRoleState
                        ? TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: kFontColor)
                        : TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: kFontColor)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey, //色
                      spreadRadius: 0.1,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
