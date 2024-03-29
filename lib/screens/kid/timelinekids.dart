//import 'package:cocoroiki_app/api_client/api.dart';
import 'dart:convert';

import 'package:cocoroiki_app/utils/api.dart';
import 'package:cocoroiki_app/components/custom_app_bar.dart';

import 'package:cocoroiki_app/components/post.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/data/database.dart';
import 'package:cocoroiki_app/provider/provider.dart';
import 'package:cocoroiki_app/screens/grandparent/menu_g_modal.dart';
// import 'package:cocoroiki_app/api_client/api.dart';

import 'package:cocoroiki_app/screens/post_screen.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class Timelinekids extends ConsumerStatefulWidget {
  const Timelinekids({super.key});

  @override
  _TimelinekidsState createState() => _TimelinekidsState();
}

class _TimelinekidsState extends ConsumerState<Timelinekids> {
  //PostListResponse posts = PostListResponse();
  Map<String, dynamic> posts = {};
  List<String> imageUrl = [];
  Map<String, dynamic> responsePosts = {};
  //var posts;

  @override
  void initState() {
    print('タイムライン画面');
    fetchSomeData();

    super.initState();
  }

  // void _onReflesh() {
  //   // Navigator.push(
  //   //     context, MaterialPageRoute(builder: (context) => Timelinekids()));
  //   fetchSomeData();
  //   super.initState();
  // }

  // Future getCommentId(int id) async {
  //   print('コメントちるぞ＝');
  //   final apiClient =
  //       ApiClient(basePath: 'https://cocoroiki-bff.yumekiti.net/api');
  //   final apiInstance = CommentApi(apiClient);
  //   try {
  //     final response = await apiInstance.getCommentsId(id);

  //     if (response != null) {
  //       print('こめんとおおおおおおおおおおおおお$response');
  //     }
  //     //setState(() => {posts = response});
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future fetchSomeData() async {
    print("①呼び出されました");
    try {
      await API().get('/api/posts').then((value) {
        print("検証");
        print(value.body);
        print("検証");

        setState(() {
          responsePosts = json.decode(value.body);
        });
        if (responsePosts != null) {
          print("検証2");
          print(responsePosts);
          print("検証3");
          print((responsePosts['data'][0]['attributes']['kids']['data'][0]
              ['attributes'] as Map<String, dynamic>)['name']);
          print("検証4");
          print(((responsePosts['data'][(responsePosts['data'].length - 1) - 0]
                  ['attributes']['images']['data'])
              .length));
          print("検証5");
          print(responsePosts['data'][(responsePosts['data'].length - 1)! - 0]
                      ['attributes']['comments']['data']
                  .length !=
              0);

          print("検証5");

          print(responsePosts['data'][(responsePosts['data'].length - 1)! - 0]
              ['attributes']['user']['data']['attributes']['name']);
          setState(() {
            posts = responsePosts.cast<String, dynamic>();
          });
          print("ここまできた");

          print(posts['data'][(posts['data'].length - 1)! - 0]['attributes']
                  ['app_users']['data']
              .length);
        }
      });
      // print('帰ってきた値:$response');
      // print(
      //     'これがいいねした人だー!!!!!${response?.data[2].attributes?.app_users?.data[0].id}');
      // print(
      //     'これがコメントしたひとだ＝＝＝！！！！！！！${response?.data[1].attributes?.comments?.data[0]}');

      //setState(() => {posts = response});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    //おばあちゃんかいなか
    //final controller = AutoScrollController();
    final userRoleState = ref.watch(userRoleProvider);
    final userIdState = ref.watch(userIdProvider);
    DateFormat outputFormat = DateFormat('yyyy年MM月dd日 H:m');
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            Stack(
              children: [
                SizedBox(
                    child: FittedBox(
                        fit: BoxFit.contain,
                        child: Image.asset('assets/image/back_check.png'))),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      posts != {}
                          ? SizedBox(
                              height: deviceH,
                              width: deviceW,
                            child: posts['data'] != null
                        ?    ListView.builder(
                                  padding: EdgeInsets.only(
                                      top: deviceH * 0.18,
                                      bottom: deviceH * 0.12),
                                  itemCount: posts['data'].length,
                                  //shrinkWrap: true,
                                  itemBuilder: ((BuildContext context, index) {
                                    return Column(
                                      children: [
                                        // PostComp(
                                        //     content: 'こんにちは',
                                        //     kidName: 'ゆうと',
                                        //     imageNum: 1,
                                        //     postUser: 'ともこ',
                                        //     parent: false,
                                        //     createdTime: DateTime.now(),
                                        //     postId: 30,
                                        //     like: 2,
                                        //     likeme: false,
                                        //     postNumber: index,
                                        //     commentId: 2),
                                        PostComp(
                                            content: posts['data'][(posts['data'].length - 1)! - index]
                                                ['attributes']['content'],
                                            kidName: (posts['data'][0]['attributes']
                                                    ['kids']['data'][0]['attributes']!
                                                as Map<String,
                                                    dynamic>)['name'],
                                            imageNum: ((posts['data'][(posts['data'].length - 1)! - index]
                                                    ['attributes']['images']['data'])!
                                                .length),
                                            postUser: posts['data'][(posts['data'].length - 1)! - index]['attributes']['user']['data']['attributes']['name'],
                                            parent: false,
                                            createdTime: DateTime.parse(posts['data'][(posts['data'].length - 1)! - index]['attributes']['createdAt']),
                                            postId: posts['data'][(posts['data'].length - 1)! - index]['id'],
                                            like: posts['data'][(posts['data'].length - 1)! - index]['attributes']['app_users']['data'].length,
                                            likeme: posts['data'][(posts['data'].length - 1)! - index]['attributes']['app_users']['data'].length == 1
                                                ? posts['data'][(posts['data'].length - 1)! - index]['attributes']['app_users']['data'][0]['id'] == userIdState
                                                : posts['data'][(posts['data'].length - 1)! - index]['attributes']['app_users']['data'].length == 2
                                                    ? posts['data'][(posts['data'].length - 1)! - index]['attributes']['app_users']['data'][0]['id'] == userIdState || posts['data'][(posts['data'].length - 1) - index]['attributes']['app_users']['data'][1]['id'] == userIdState
                                                    : false,
                                            postNumber: index,
                                            commentId: posts['data'][(posts['data'].length - 1)! - index]['attributes']['comments']['data'].length != 0 ? posts['data'][(posts['data'].length - 1) - index]['attributes']['comments']['data'][0]['id'] : null
                                        ),
                                        SizedBox(height: 21),
                                      ],
                                    );
                                  }))
                              : Container())
                          : Container(),
                    ],
                  ),
                ),
                // Positioned(
                //   bottom: 0,
                //   child: Container(
                //     height: deviceH * 0.315,
                //     width: deviceW,
                //     decoration:
                //         BoxDecoration(color: Colors.white.withOpacity(0.9)),
                //   ),
                // ),
                CustomAppBar(
                    title: 'タイムライン',
                    reading: userRoleState ? '' : 'humberger.svg'),
              ],
            ),
          ],
        ),
        floatingActionButton: userRoleState == false
            // ? FloatingActionButton(
            //     elevation: 0,
            //     backgroundColor: Color(0xFFFCCC00),
            //     onPressed: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => const PostScreen()));
            //     },
            //     child: const Icon(Icons.add, color: Colors.white))
            ? GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PostScreen()));
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset('assets/svg/newpost.svg'),
                    Icon(Icons.add, color: Colors.white, size: 35)
                  ],
                ),
              )
            : GestureDetector(
                onTap: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) => MenuGModal(
                            timelineButton: false,
                          ));
                },
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SvgPicture.asset('assets/svg/menu_button.svg'),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            'メニュー',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Zen-B',
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 4.5
                                ..color = kshadoeColor,
                            ),
                          ),
                          Text(
                            'メニュー',
                            style: TextStyle(
                              fontFamily: 'Zen-B',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
  }
}
