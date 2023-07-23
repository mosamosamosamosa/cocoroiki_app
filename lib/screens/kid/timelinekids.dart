import 'package:cocoroiki_app/api_client/api.dart';
import 'package:cocoroiki_app/components/custom_app_bar.dart';

import 'package:cocoroiki_app/components/post.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/data/database.dart';
import 'package:cocoroiki_app/provider/provider.dart';
import 'package:cocoroiki_app/screens/grandparent/timeline/menu_screen.dart';
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
  PostListResponse posts = PostListResponse();
  List<String> imageUrl = [];

  //var posts;

  @override
  void initState() {
    fetchSomeData();
    super.initState();
  }

  void _onReflesh() {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => Timelinekids()));
    fetchSomeData();
    super.initState();
  }

  Future fetchSomeData() async {
    final apiClient =
        ApiClient(basePath: 'https://cocoroiki-bff.yumekiti.net/api');
    final apiInstance = PostApi(apiClient);
    try {
      final response = await apiInstance.getPosts();
      print('帰ってきた値:$response');
      if (response != null) {
        setState(() {
          posts = response;
        });
      }
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
    DateFormat outputFormat = DateFormat('yyyy年MM月dd日 H:m');
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            Stack(
              children: [
                Image.asset('assets/image/back_check.png'),
                CustomRefreshIndicator(
                  onRefresh: () async {
                    _onReflesh();
                  },
                  builder: MaterialIndicatorDelegate(
                    builder: (context, controller) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            SvgPicture.asset('assets/svg/green.svg'),
                          ],
                        ),
                      );
                    },
                  ),
                  child: Column(
                    children: [
                      posts != null
                          ? SizedBox(
                              height: deviceH,
                              width: deviceW,
                              child: ListView.builder(
                                  padding: EdgeInsets.only(
                                      top: deviceH * 0.18,
                                      bottom: deviceH * 0.12),
                                  itemCount: posts.data.length,
                                  //shrinkWrap: true,
                                  itemBuilder: ((BuildContext context, index) {
                                    return Column(
                                      children: [
                                        PostComp(
                                            content: posts
                                                .data[(posts.data.length - 1) -
                                                    index]
                                                .attributes
                                                ?.content,
                                            kidName: (posts.data[0].attributes
                                                    ?.kids?.data[0].attributes
                                                as Map<String,
                                                    dynamic>)['name'],
                                            imageNum:
                                                ((posts.data[(posts.data.length - 1) - index].attributes?.images?.data)!
                                                    .length),
                                            postUser: posts
                                                .data[(posts.data.length - 1) - index]
                                                .attributes!
                                                .user
                                                ?.data
                                                ?.attributes
                                                ?.name,
                                            parent: false,
                                            createdTime: posts.data[(posts.data.length - 1) - index].attributes!.createdAt,
                                            postId: posts.data[(posts.data.length - 1) - index].id,
                                            like: posts.data[(posts.data.length - 1) - index].attributes?.like),
                                        SizedBox(height: 21)
                                      ],
                                    );
                                  })))
                          : Container()
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MenuScreen()));
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
