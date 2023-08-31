import 'dart:async';

import 'package:cocoroiki_app/api_client/api.dart';
import 'package:cocoroiki_app/components/bottom_button.dart';
import 'package:cocoroiki_app/components/buttom_bar.dart';

import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/provider/provider.dart';
import 'package:cocoroiki_app/screens/kid/quest/present_modal.dart';
import 'package:cocoroiki_app/screens/kid/quest/quest_check_modal.dart';
import 'package:cocoroiki_app/screens/kid/quest/quest_modal.dart';
import 'package:cocoroiki_app/screens/kid/quest/quest_screen.dart';
import 'package:cocoroiki_app/screens/kid/timelinekids.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class GrandchildScreen extends ConsumerStatefulWidget {
  const GrandchildScreen({super.key, required this.questClose});

  final questClose;

  @override
  ConsumerState<GrandchildScreen> createState() => _GrandchildScreenState();
}

class _GrandchildScreenState extends ConsumerState<GrandchildScreen>
    with TickerProviderStateMixin {
  bool visiWatermark = true;
  bool visiJouro = false;
  bool visiYellowmark = false;
  bool visiQuest = false;
  // var _isChanged = false;
  bool visiButton = false;

  bool flagTimeline = false;
  bool flagHome = false;
  bool flagQuest = false;
  bool questClose = false;

  int chatComment = 0;
  bool plazaButton = true;
  bool visiWater = false;
  bool visiKirakira = false;
  late final AnimationController _controller;
  TreeListResponse posts = TreeListResponse();

  var _isChanged = false;

  //木の状態
  int? treeStatus = 0;

  List<String> questList = [];
  String quest = '';

  int qCount = 0;

  bool check = false;
  bool close = true;
  bool continueQuestFlag = false;

  // @override
  // void initState() {
  //   fetchSomeData();
  //   if (questClose) {
  //     Future(() {
  //       showDialog(
  //           barrierDismissible: false,
  //           context: context,
  //           builder: (BuildContext context) => QuestModal(
  //                 start: true,
  //                 quest: 'クエスト表示',
  //               )).then(((value) => setState(() {
  //             visiQuest = true;
  //             Timer.periodic(const Duration(seconds: 30), (_) {
  //               setState(() {
  //                 chatComment++;
  //               });

  //               print("5秒毎に実行:chatComment$chatComment");
  //             });
  //             Timer.periodic(const Duration(seconds: 1200), (_) {
  //               setState(() {
  //                 visiWatermark = true;
  //               });

  //               print("秒毎に実行:chatComment$chatComment");
  //             });
  //           })));
  //     });
  //   } else {
  //     setState(() {
  //       visiQuest = true;
  //     });
  //     Timer.periodic(const Duration(seconds: 10), (_) {
  //       setState(() {
  //         chatComment++;
  //       });

  //       print("5秒毎に実行:chatComment$chatComment");
  //     });
  //     // Timer.periodic(const Duration(seconds: 30), (_) {
  //     //   setState(() {
  //     //     visiWatermark = true;
  //     //   });

  //     //   print("秒毎に実行:chatComment$chatComment");
  //     // });
  //   }
  //   _controller =
  //       AnimationController(duration: Duration(seconds: 30), vsync: this);
  //   //super.initState();
  //   print(treeStatus);
  // }

  // Future fetchSomeData() async {
  //   print('ここきた');

  //   // final grandListState = ref.watch(grandListProvider);
  //   // final userIdState = ref.watch(userIdProvider);
  //   final apiClient =
  //       ApiClient(basePath: 'https://cocoroiki-bff.yumekiti.net/api');
  //   final apiInstance = TreeApi(apiClient);
  //   try {
  //     final response = await apiInstance.getTrees();
  //     print('帰ってきた値:$response');
  //     if (response != null) {
  //       print('ここ');

  //       for (int i = 0; i < response.data.length; i++) {
  //         print('ここ');
  //         if (response.data[i].attributes?.parent?.data[0].id == 1 &&
  //             response.data[i].attributes?.grandparent?.data[0].id == 3) {
  //           setState(() {
  //             treeStatus = response.data[i].attributes?.state;
  //           });
  //           print(treeStatus);
  //         }
  //       }
  //       setState(() {});
  //     }
  //     //setState(() => {posts = response});
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // @override
  // void dispose() {
  //   print('消すとこ来たよ');
  //   super.dispose();
  //   _controller.dispose();
  // }
  //画面遷移した時の処理
  @override
  void initState() {
    //final questNotifier = ref.watch(questProvider.notifier);
    //final questState = ref.watch(questProvider);

    //fetchSomeData();
    setState(() {
      close = widget.questClose;
    });
    questCount().then((value) {
      setState(() {
        if (0 <= qCount && qCount <= 3) {
          treeStatus = 1;
        } else if (4 <= qCount && qCount <= 34) {
          treeStatus = 2;
        } else if (35 <= qCount && qCount <= 85) {
          treeStatus = 3;
        } else if (86 <= qCount && qCount <= 166) {
          treeStatus = 4;
        } else if (167 <= qCount && qCount <= 267) {
          treeStatus = 5;
        }
      });

      setState(() {
        continueQuestFlag = false;
      });

      if (close) {
        print('クエスト閉じてるとき');
        setState(() {
          visiQuest = true;
          Timer.periodic(const Duration(seconds: 10), (_) {
            setState(() {
              chatComment++;
            });

            print("5秒毎に実行:chatComment$chatComment");
          });
          Timer.periodic(const Duration(seconds: 1200), (_) {
            setState(() {
              visiWatermark = true;
            });
          });
        });
      } else {
        print('クエスト開いてるとき');
        setState(() {
          visiQuest = true;
        });
        Timer.periodic(const Duration(seconds: 10), (_) {
          setState(() {
            chatComment++;
          });

          print("5秒毎に実行:chatComment$chatComment");
        });
        // Timer.periodic(const Duration(seconds: 30), (_) {
        //   setState(() {
        //     visiWatermark = true;
        //   });

        //   print("秒毎に実行:chatComment$chatComment");
        // });
      }
    });

    _controller =
        AnimationController(duration: Duration(seconds: 30), vsync: this);
    //super.initState();
    print(treeStatus);
  }

  void _onReflesh() {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => Timelinekids()));

    super.initState();
  }

  Future questCount() async {
    final apiClient =
        ApiClient(basePath: 'https://cocoroiki-bff.yumekiti.net/api');
    final apiInstance = QuestStatusApi(apiClient);
    try {
      final response = await apiInstance.getQuestStatuses();
      print(response);
      //setState(() => queststatus = response);
      setState(() {
        qCount = 0;
      });
      for (int i = 0; i < (response?.data)!.length; i++) {
        if (response?.data[i].attributes?.tree?.data?.id == 1) {
          if (response?.data[i].attributes?.doing == false) {
            setState(() {
              qCount++;
            });

            print('あああああああああああああああああああああああああ:$qCount');
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    print('消すとこ来たよ');
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;

    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: kBackgroundColors,
            stops: [
              0.3,
              0.6,
            ],
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(alignment: Alignment.bottomCenter, children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                      width: deviceW,
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Image.asset('assets/image/room_back.png')))),
              Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          initState();
                        },
                        child: Stack(
                          children: [
                            SvgPicture.asset('assets/svg/board.svg'),
                            Positioned(
                              top: 80,
                              left: 0,
                              right: 0,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Text(
                                    'ゆうとくん',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'Zen-B',
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 5
                                        ..color = Color(0xFF835237),
                                    ),
                                  ),
                                  Text(
                                    'ゆうとくん',
                                    style: TextStyle(
                                      fontFamily: 'Zen-B',
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 6),
                      qCount == 0
                          ? Image.asset('assets/image/mater1_0.png')
                          : qCount == 1
                              ? Image.asset('assets/image/mater1_1.png')
                              : qCount == 2
                                  ? Image.asset('assets/image/mater1_2.png')
                                  : qCount == 3
                                      ? Image.asset('assets/image/mater1_3.png')
                                      : 4 <= qCount && qCount <= 13
                                          ? Image.asset(
                                              'assets/image/mater1_0.png')
                                          : 14 <= qCount && qCount <= 23
                                              ? Image.asset(
                                                  'assets/image/mater1_1.png')
                                              : 24 <= qCount && qCount <= 34
                                                  ? Image.asset(
                                                      'assets/image/mater1_2.png')
                                                  : Container()
                    ],
                  )),
              Positioned(
                  bottom: 217,
                  right: 0,
                  left: 0,
                  child: GestureDetector(
                      onHorizontalDragUpdate: (details) => print('ふりふり'),
                      onHorizontalDragEnd: (details) => print('ふりふり終了'),
                      child: treeStatus == 1
                          ? SvgPicture.asset('assets/svg/green.svg')
                          : treeStatus == 2
                              ? SvgPicture.asset('assets/svg/green2.svg')
                              : treeStatus == 3
                                  ? SvgPicture.asset('assets/svg/green3.svg')
                                  : treeStatus == 4
                                      ? SvgPicture.asset(
                                          'assets/svg/green4.svg')
                                      : treeStatus == 5
                                          ? SvgPicture.asset(
                                              'assets/svg/green5.svg')
                                          : Container())),
              Visibility(
                  visible: visiQuest,
                  child: Positioned(
                    top: 240,
                    left: 36,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset('assets/svg/chat.svg'),
                        close
                            ? chatComment % 2 == 0
                                ? Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'ゆうとくんが',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Zen-B',
                                              fontSize: 20),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              'クエスト',
                                              style: TextStyle(
                                                  color: Color(0xFF509D01),
                                                  fontFamily: 'Zen-B',
                                                  fontSize: 22),
                                            ),
                                            Text(
                                              'を達成しました！',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Zen-B',
                                                  fontSize: 18),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'お水',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Zen-B',
                                                  color: Color(0xFF38D3F4)),
                                            ),
                                            Text(
                                              'をあげて',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Zen-B'),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '一緒に木を育てましょう！',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'Zen-B'),
                                        ),
                                      ],
                                    ),
                                  )
                            : chatComment % 2 == 0
                                ? Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'ゆうとくんが',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Zen-B',
                                              fontSize: 20),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              'クエスト実行中',
                                              style: TextStyle(
                                                  color: Color(0xFF509D01),
                                                  fontFamily: 'Zen-B',
                                                  fontSize: 22),
                                            ),
                                            Text(
                                              ' です！',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Zen-B',
                                                  fontSize: 18),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'お水',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Zen-B',
                                                  color: Color(0xFF38D3F4)),
                                            ),
                                            Text(
                                              'をあげて',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Zen-B'),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '応援してあげてください！',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'Zen-B'),
                                        ),
                                      ],
                                    ),
                                  )
                      ],
                    ),
                  )),
              Visibility(
                visible: visiQuest,
                child: Positioned(
                    top: 230,
                    right: -20,
                    child: GestureDetector(
                        onLongPress: () {
                          setState(() {
                            visiQuest = false;
                          });

                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) =>
                                  QuestCheckModa());
                        },
                        child: Lottie.asset('assets/json/yousei.json'))),
              ),
              Visibility(
                visible: visiJouro,
                child: Positioned(
                    top: 216,
                    right: 19,
                    child: Draggable(
                        onDragStarted: () {
                          setState(() {
                            visiJouro = false;
                          });
                        },
                        onDragCompleted: () {
                          print('ドラッグ完了');
                          setState(() {
                            visiJouro = false;
                            visiYellowmark = false;
                            //_isChanged = false;
                            visiButton = false;

                            visiWater = true;
                          });
                          Future.delayed(Duration(milliseconds: 4800), () {
                            setState(() {
                              visiWater = false;

                              visiQuest = true;
                              plazaButton = true;
                              visiKirakira = true;
                            });
                            Future.delayed(Duration(seconds: 30), () {
                              setState(() {
                                visiKirakira = false;
                              });
                            });
                          });
                          print('ドラッグ完了:$visiButton');
                        },
                        feedback: SvgPicture.asset('assets/svg/jouro.svg'),
                        child: SvgPicture.asset('assets/svg/jouro.svg'))),
              ),
              Visibility(
                visible: visiYellowmark,
                child: Positioned(
                    bottom: 300,
                    right: 120,
                    child: DragTarget(
                      builder: (BuildContext context,
                          List<Object?> candidateData,
                          List<dynamic> rejectedData) {
                        return SvgPicture.asset('assets/svg/yellowpoint.svg');
                      },
                    )),
              ),
              // Visibility(
              //   visible: visiYellowmark,
              //   child: AnimatedPositioned(
              //     bottom: _isChanged ? 300 : 400,
              //     right: _isChanged ? 120 : 19,
              //     duration: Duration(/*アニメーションの時間*/),
              //     child: SvgPicture.asset('assets/svg/touch.svg'),
              //   ),
              // ),
              Visibility(
                visible: visiYellowmark,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 410),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'じょうろをひっぱって\nみずをあげてください！',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1.2,
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = Colors.white),
                      ),
                      Text(
                        'じょうろをひっぱって\nみずをあげてください！',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                          fontFamily: 'Inter',
                          fontSize: 24,
                          color: Color(0xFF553A25),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: visiWatermark,
                child: Positioned(
                    bottom: treeStatus == 1 ? 320 : 380,
                    right: 0,
                    left: 0,
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            visiQuest = false;
                            visiWatermark = false;
                            visiJouro = true;
                            visiYellowmark = true;
                            plazaButton = false;
                            //_isChanged = true;
                          });
                        },
                        child: SvgPicture.asset('assets/svg/water_mark.svg'))),
              ),
              Positioned(
                bottom: 56,
                child: GestureDetector(
                  onTap: () {
                    if (plazaButton) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuestScreen()));
                    } else {
                      setState(() {
                        visiJouro = false;
                        visiYellowmark = false;
                        //_isChanged = false;
                        visiButton = false;
                        visiQuest = true;
                        plazaButton = true;
                        visiWater = false;
                        //visiWater = true;
                      });
                    }
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QuestScreen()));
                    },
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        SvgPicture.asset('assets/svg/plaza_back_container.svg'),
                        plazaButton
                            ? Column(
                                children: [
                                  SvgPicture.asset(
                                      'assets/svg/hiroba_icon.svg'),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 6),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Text(
                                          'ひろば\nへもどる',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            height: 1.2,
                                            fontSize: 14,
                                            fontFamily: 'Zen-B',
                                            foreground: Paint()
                                              ..style = PaintingStyle.stroke
                                              ..strokeWidth = 3
                                              ..color = Color(0xFF3E0E0E),
                                          ),
                                        ),
                                        Text(
                                          'ひろば\nへもどる',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            height: 1.2,
                                            fontFamily: 'Zen-B',
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Padding(
                                padding: const EdgeInsets.only(bottom: 24),
                                child: SvgPicture.asset(
                                    'assets/svg/plaza_batsu.svg'),
                              )
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: visiWater,
                child: Positioned(
                    bottom: 200,
                    right: 36,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          visiWater = false;
                          visiQuest = true;
                          plazaButton = true;
                          visiKirakira = true;
                        });
                        Future.delayed(Duration(seconds: 30), () {
                          setState(() {
                            visiKirakira = false;
                          });
                        });
                        // Future.delayed(Duration(seconds: 5), () {
                        //   print('指いくぞ！');
                        //   setState(() {
                        //     _isChanged = true;
                        //   });
                        // });
                      },
                      child: LottieBuilder.asset(
                        'assets/json/water.json',
                        //controller: _controller,
                      ),
                    )),
              ),
              Visibility(
                visible: visiKirakira,
                child: Positioned(
                    bottom: 190,
                    child: Lottie.asset('assets/json/kirakira.json')),
              )
            ])));
  }
}
