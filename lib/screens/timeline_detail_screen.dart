import 'package:cocoroiki_app/api_client/api.dart';
import 'package:cocoroiki_app/components/custom_app_bar.dart';
import 'package:cocoroiki_app/components/favorite_button.dart';
import 'package:cocoroiki_app/components/post_image_four.dart';
import 'package:cocoroiki_app/components/post_image_one.dart';
import 'package:cocoroiki_app/components/post_image_three.dart';
import 'package:cocoroiki_app/components/post_image_two.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/data/database.dart';
import 'package:cocoroiki_app/provider/provider.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeAgo;

class TimelineDetailScreen extends ConsumerStatefulWidget {
  const TimelineDetailScreen(
      {super.key,
      required this.postId,
      required this.imageNum,
      required this.imageList,
      required this.like,
      required this.likeme,
      required this.commentId});

  final num postId;
  final int imageNum;
  final List<String> imageList;
  final int like;

  final bool likeme;
  final num? commentId;

  @override
  _TimelineDetailScreenState createState() => _TimelineDetailScreenState();
}

class _TimelineDetailScreenState extends ConsumerState<TimelineDetailScreen> {
  PostResponse postDetail = PostResponse();
  CommentListResponse comDetail = CommentListResponse();
  List<int> commentList = [];
  Widget post = Container();
  bool commentme = false;

  @override
  void initState() {
    print(widget.likeme);
    fetchSomeData().then(
      (value) {
        if (widget.commentId != null) {
          getCommentId(widget.commentId!);
        }
        setState(() {
          if (widget.imageNum == 1) {
            post = PostImageOne(myPost: true, imageList: widget.imageList);
          } else if (widget.imageNum == 2) {
            post = PostImageTwo(myPost: true, imageList: widget.imageList);
          } else if (widget.imageNum == 3) {
            post = PostImageThree(myPost: true, imageList: widget.imageList);
          } else {
            post = PostImageFour(myPost: true, imageList: widget.imageList);
          }
        });
      },
    );
    //fetchSomeDataComment(1);
    print(widget.imageList.length);
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
      final response = await apiInstance.getPostsId(widget.postId);
      // print('帰ってきた値:$response');
      // print('content:${response?.data?.attributes?.content}');

      //print('コメント：${postDetail?.data?.attributes?.comments?.data.length}');
      if (response != null) {
        if (response.data?.attributes?.comments?.data != null) {
          for (int i = 0;
              i < (response.data?.attributes?.comments?.data)!.length;
              i++) {
            //print('for文まできてる');
            commentList.add(
                (response.data?.attributes?.comments?.data[i].id)!.toInt());
          }
          setState(() => postDetail = response);
        } else {}
        //print((postDetail?.data?.attributes?.comments?.data[0].id)!.toInt());
        print('commentList : $commentList');
      }
    } catch (e) {
      print(e);
    }
  }

  // Future fetchSomeDataComment(int id) async {
  //   final apiClient =
  //       ApiClient(basePath: 'https://cocoroiki-bff.yumekiti.net/api');
  //   final apiInstance = CommentApi(apiClient);
  //   try {
  //     final response = await apiInstance.getCommentsId(id);

  //     setState(() => comDetail = response);

  //     print(response);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future fetchSomeDataComments() async {
  //   final apiClient =
  //       ApiClient(basePath: 'https://cocoroiki-bff.yumekiti.net/api');
  //   final apiInstance = CommentApi(apiClient);
  //   try {
  //     final response = await apiInstance.getComments();
  //     setState(() {
  //       comDetail = response;
  //     });

  //     print(response);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  String createTimeAgoString(DateTime postDateTime) {
    final now = DateTime.now();
    final difference = now.difference(postDateTime);
    return timeAgo.format(now.subtract(difference), locale: "ja");
  }

  @override
  Widget build(BuildContext context) {
    final userRoleState = ref.watch(userRoleProvider);
    timeAgo.setLocaleMessages("ja", timeAgo.JaMessages());
    DateFormat outputFormat = DateFormat('yyyy年MM月dd日 H時m分');
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;

    if (postDetail == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
          backgroundColor: kBackgroundColor,
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: deviceH * 0.16, bottom: deviceH * 0.001),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 28, top: 23),
                        child: Text(
                          outputFormat.format(
                              ((postDetail.data?.attributes?.createdAt)!)),
                          style: TextStyle(
                              color: Color(0xFF919191),
                              fontWeight: FontWeight.bold,
                              fontSize: userRoleState ? 18 : 14),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 28, top: 16, right: 26),
                          child: (postDetail.data?.attributes?.content) != null
                              ? Text(
                                  (postDetail.data?.attributes?.content)
                                      .toString(),
                                  style: TextStyle(
                                      color: kFontColor,
                                      fontSize: userRoleState ? 20 : 16))
                              : Text('')),
                      SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(width: 10),
                          post,
                          SizedBox(width: 10)
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 21),
                          Row(
                            children: [
                              //FavoriteButton(),
                              userRoleState
                                  ? widget.likeme
                                      ? SvgPicture.asset(
                                          'assets/svg/pink_like_grand.svg')
                                      : SvgPicture.asset(
                                          'assets/svg/like_grand.svg')
                                  : widget.likeme
                                      ? SvgPicture.asset(
                                          'assets/svg/pink_like.svg')
                                      : SvgPicture.asset('assets/svg/like.svg'),

                              postDetail.data?.attributes?.appUsers?.data
                                              .length ==
                                          null ||
                                      postDetail.data?.attributes?.appUsers
                                              ?.data.length ==
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
                                          (postDetail.data?.attributes?.appUsers
                                                  ?.data.length)
                                              .toString(),
                                          style: TextStyle(
                                              color: Color(0xFF949494),
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  userRoleState ? 20 : 16),
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                          SizedBox(width: 32),
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
                                      : SvgPicture.asset(
                                          'assets/svg/comment.svg'),
                              postDetail.data?.attributes?.comments?.data
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
                                          (postDetail.data?.attributes?.comments
                                                  ?.data.length)
                                              .toString(),
                                          style: TextStyle(
                                              color: Color(0xFF949494),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ],
                                    )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: userRoleState
                                    ? deviceW * 0.35
                                    : deviceW * 0.44),
                            child: Container(
                              alignment: Alignment.center,
                              height: 32,
                              width: 70,
                              child: Text(
                                  '${(postDetail.data?.attributes?.kids?.data[0].attributes as Map<String, dynamic>)['name']}',
                                  style: TextStyle(
                                      fontSize: userRoleState ? 16 : 14,
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
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 0),
                        child: Divider(
                            color: kBorderColor,
                            thickness: 0.5,
                            indent: 18,
                            endIndent: 18),
                      ),
                      postDetail.data?.attributes?.comments?.data.length == 0
                          ? Container()
                          : SizedBox(
                              child: Container(
                                height: deviceH,
                                width: deviceW,
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: postDetail
                                      .data?.attributes?.comments?.data.length,
                                  padding: EdgeInsets.only(
                                      top: deviceH * 0.012,
                                      bottom: deviceH * 0.2),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 24, bottom: 16),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                  height: 40,
                                                  width: 40,
                                                  child: CircleAvatar(
                                                      radius: 32,
                                                      foregroundImage:
                                                          NetworkImage(
                                                              users_list[1]
                                                                  .image))),
                                              SizedBox(width: 8),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text('よしえ',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  userRoleState
                                                                      ? 20
                                                                      : 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  kFontColor)),
                                                      SizedBox(width: 16),
                                                      Text(
                                                          createTimeAgoString(
                                                              (postDetail
                                                                  .data
                                                                  ?.attributes
                                                                  ?.comments
                                                                  ?.data[0]
                                                                  .attributes
                                                                  ?.createdAt)!),
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFF919191),
                                                              fontSize:
                                                                  userRoleState
                                                                      ? 18
                                                                      : 14)),
                                                    ],
                                                  ),
                                                  SizedBox(height: 4),
                                                  SizedBox(
                                                    width: 294,
                                                    child: Text(
                                                      (postDetail
                                                              .data
                                                              ?.attributes
                                                              ?.comments
                                                              ?.data[0]
                                                              .attributes
                                                              ?.content)
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontFamily: 'Zen-B',
                                                          fontSize:
                                                              userRoleState
                                                                  ? 18
                                                                  : 14,
                                                          color: kFontColor),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 20),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                  height: 40,
                                                  width: 40,
                                                  child: CircleAvatar(
                                                      radius: 32,
                                                      foregroundImage:
                                                          NetworkImage(
                                                              users_list[0]
                                                                  .image))),
                                              SizedBox(width: 8),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text('ともこ',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  userRoleState
                                                                      ? 20
                                                                      : 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  kFontColor)),
                                                      SizedBox(width: 16),
                                                      Text(
                                                          createTimeAgoString(
                                                              (postDetail
                                                                  .data
                                                                  ?.attributes
                                                                  ?.comments
                                                                  ?.data[0]
                                                                  .attributes
                                                                  ?.createdAt)!),
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFF919191),
                                                              fontSize:
                                                                  userRoleState
                                                                      ? 18
                                                                      : 14)),
                                                    ],
                                                  ),
                                                  SizedBox(height: 4),
                                                  SizedBox(
                                                    width: 294,
                                                    child: Text(
                                                      'ありがとう。\n夏休みゆうとと遊びにいくね。',
                                                      style: TextStyle(
                                                          fontFamily: 'Zen-B',
                                                          fontSize:
                                                              userRoleState
                                                                  ? 18
                                                                  : 14,
                                                          color: kFontColor),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              CustomAppBar(
                title:
                    '${postDetail.data?.attributes?.user?.data?.attributes?.name}の投稿',
                reading: 'back_button.svg',
              ),
              // VerticalDivider(
              //   color: Color(0xFFAFAFAF),
              //   thickness: 0.5,
              //   width: 42,
              //   indent: 40,
              //   endIndent: 40,
              // ),
            ],
          ));
    }
  }
}
