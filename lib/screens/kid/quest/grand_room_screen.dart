import 'dart:async';
import 'dart:math' as math;

import 'package:cocoroiki_app/api_client/api.dart';
import 'package:cocoroiki_app/components/bottom_button.dart';
import 'package:cocoroiki_app/components/buttom_bar.dart';

import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/provider/provider.dart';
import 'package:cocoroiki_app/screens/kid/quest/present_modal.dart';
import 'package:cocoroiki_app/screens/kid/quest/quest_check_modal.dart';
import 'package:cocoroiki_app/screens/kid/quest/quest_modal.dart';
import 'package:cocoroiki_app/screens/kid/quest/quest_screen.dart';
import 'package:cocoroiki_app/screens/kid/quest/tree_grow_modal.dart';
import 'package:cocoroiki_app/screens/kid/timelinekids.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class GrandRoomScreen extends ConsumerStatefulWidget {
  const GrandRoomScreen(
      {super.key,
      required this.grandName,
      required this.gender,
      required this.questClose,
      required this.online});
  final String grandName;
  final String gender;
  final bool questClose;
  final bool online;

  @override
  ConsumerState<GrandRoomScreen> createState() => _GrandRoomScreenState();
}

class _GrandRoomScreenState extends ConsumerState<GrandRoomScreen>
    with TickerProviderStateMixin {
  bool visiWatermark = true;
  bool visiJouro = false;
  bool visiYellowmark = false;
  bool visiQuest = false;
  // var _isChanged = false;
  bool visiButton = false;
  bool continueQuestFlag = false;

  bool flagTimeline = false;
  bool flagHome = false;
  bool flagQuest = false;

  int chatComment = 0;
  bool plazaButton = true;
  bool visiWater = false;
  bool visiKirakira = false;
  bool close = true;
  late final AnimationController _controller;
  TreeListResponse posts = TreeListResponse();

  List<String> questList = [];
  String quest = '';

  int qCount = 0;

  var _isChanged = false;

  //木の状態
  int? treeStatus = 0;
  bool check = false;

  //画面遷移した時の処理
  @override
  void didChangeDependencies() {
    final questNotifier = ref.watch(questProvider.notifier);
    final questState = ref.watch(questProvider);
    if (!check) {
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
          questSelect(widget.online).then(((value) {
            var random = math.Random();
            int i = random.nextInt(questList.length);
            questNotifier.state = questList[i];
            setState(() {
              quest = questList[i];
            });
            Future(() {
              print('①クエストモーダルきたああああああああああああ');
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) => QuestModal(
                        start: true,
                        quest: questList[i],
                      )).then(((value) => setState(() {
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

                      print("秒毎に実行:chatComment$chatComment");
                    });
                  })));
            });
          }));
        } else {
          setState(() {
            visiQuest = true;
            quest = questState;
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
  }

  //閉じるボタン押した時の処理
  Future questEnd() async {
    print(treeStatus);
    final questNotifier = ref.watch(questProvider.notifier);
    final questState = ref.watch(questProvider);

    questCount().then((value) {
      if (qCount == 4) {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => TreeGrowModal());
      }
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
        continueQuestFlag = true;
      });
    });
  }

  //クエスト風船押した時の処理
  Future questOpen() async {
    final questNotifier = ref.watch(questProvider.notifier);
    final questState = ref.watch(questProvider);

    setState(() {
      close = widget.questClose;
    });

    setState(() {
      continueQuestFlag = false;
    });

    questSelect(false).then(((value) {
      var random = math.Random();
      int i = random.nextInt(questList.length);
      questNotifier.state = questList[i];
      setState(() {
        quest = questList[i];
      });
      Future(() {
        print('②クエストモーダルきたああああああああああああ');
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => QuestModal(
                  start: true,
                  quest: questList[i],
                )).then(((value) => setState(() {
              visiQuest = true;
            })));
      });
    }));

    _controller =
        AnimationController(duration: Duration(seconds: 30), vsync: this);
    //super.initState();
    print(treeStatus);
  }

  Future fetchSomeData() async {
    print('ここきた');

    // final grandListState = ref.watch(grandListProvider);
    // final userIdState = ref.watch(userIdProvider);
    final apiClient =
        ApiClient(basePath: 'https://cocoroiki-bff.yumekiti.net/api');
    final apiInstance = TreeApi(apiClient);
    try {
      final response = await apiInstance.getTrees();
      print('帰ってきた値:$response');
      if (response != null) {
        print('ここ');

        for (int i = 0; i < response.data.length; i++) {
          print('ここ');
          if (response.data[i].attributes?.parent?.data[0].id == 1 &&
              response.data[i].attributes?.grandparent?.data[0].id == 3) {
            setState(() {
              treeStatus = response.data[i].attributes?.state;
            });
            print(treeStatus);
          }
        }
        setState(() {});
      }
      //setState(() => {posts = response});
    } catch (e) {
      print(e);
    }
    super.didChangeDependencies();
  }

  Future questCount() async {
    final apiClient =
        ApiClient(basePath: 'https://cocoroiki-bff.yumekiti.net/api');
    final apiInstance = QuestStatusApi(apiClient);
    try {
      final response = await apiInstance.getQuestStatuses();
      print(response);
      setState(() {
        qCount = 0;
      });

      //setState(() => queststatus = response);
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

  //クエスト選択
  Future questSelect(bool online) async {
    final apiClient =
        ApiClient(basePath: 'https://cocoroiki-bff.yumekiti.net/api');
    final apiInstance = QuestApi(apiClient);
    try {
      final response = await apiInstance.getQuests();
      print(response);
      //setState(() => queststatus = response);
      for (int i = 0; i < (response?.data)!.length; i++) {
        if (response
                ?.data[i].attributes?.questKinds?.data[0].attributes?.online ==
            online) {
          setState(() {
            questList.add((response?.data[i].attributes?.content)!);
          });
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
                  child: Container(
                      width: deviceW,
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Image.asset('assets/image/room_back.png')))),
              Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Stack(
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
                                  widget.gender == 'female'
                                      ? '${widget.grandName}おばあちゃん'
                                      : '${widget.grandName}おじいちゃん',
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
                                  widget.gender == 'female'
                                      ? '${widget.grandName}おばあちゃん'
                                      : '${widget.grandName}おじいちゃん',
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
                        chatComment % 2 == 0
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'きょうのクエストは',
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
                                          quest,
                                          style: TextStyle(
                                              color: Color(0xFF509D01),
                                              fontFamily: 'Zen-B',
                                              fontSize: 24),
                                        ),
                                        Text(
                                          'だよ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Zen-B',
                                              fontSize: 20),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  'クエストがおわったら\nおかあさんにつたえてね！',
                                  style: TextStyle(
                                      fontSize: 20, fontFamily: 'Zen-B'),
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
                        onLongPress: () async {
                          setState(() async {
                            check = true;
                            visiQuest = false;
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) =>
                                    QuestCheckModa()).then((value) {
                              continueQuestFlag = value;
                              questEnd();
                            });
                          });
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
                        'じょうろをひっぱって\nみずをあげよう！',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1.2,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = Colors.white),
                      ),
                      Text(
                        'じょうろをひっぱって\nみずをあげよう！',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                          fontFamily: 'Inter',
                          fontSize: 20,
                          color: Color(0xFF553A25),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                //visible: visiWatermark,
                visible: false,
                child: Positioned(
                    bottom: treeStatus == 1
                        ? 310
                        : treeStatus == 2
                            ? 380
                            : treeStatus == 3
                                ? 380
                                : treeStatus == 4
                                    ? 390
                                    : treeStatus == 5
                                        ? 420
                                        : 0,
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
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SvgPicture.asset('assets/svg/plaza_back_container.svg'),
                      plazaButton
                          ? Column(
                              children: [
                                SvgPicture.asset('assets/svg/plaza_tree.svg'),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 6),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Text(
                                        'ひろばに\nもどる',
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
                                        'ひろばに\nもどる',
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
              ),
              Visibility(
                visible: continueQuestFlag,
                child: Positioned(
                    top: 190,
                    left: 24,
                    child: SizedBox(
                        height: 200,
                        width: 120,
                        child: GestureDetector(
                            onTap: () {
                              questOpen();
                            },
                            child: Lottie.asset('assets/json/quest_1.json')))),
              )
            ])));
  }
}
