import 'dart:math' as math;
import 'package:cocoroiki_app/api_client/api.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/screens/kid/quest/grand_room_screen.dart';
import 'package:cocoroiki_app/screens/kid/quest/grand_room_screen2.dart';
import 'package:cocoroiki_app/screens/kid/quest/present_modal.dart';
import 'package:cocoroiki_app/screens/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class QuestCheckModa extends StatefulWidget {
  const QuestCheckModa({super.key});

  @override
  State<QuestCheckModa> createState() => _QuestCheckModaState();
}

class _QuestCheckModaState extends State<QuestCheckModa> {
  final controller = TextEditingController();
  bool visiCheck = false;
  bool open = false;
  bool result = false;
  int flag = 0;
  bool mokumoku = false;
  bool checkModal = false;
  bool present = false;
  int presentFlag = 0;
  List<String> rewardList = ['１０円ゲット！', 'おやつゲット！'];
  String reward = '';
  bool json = false;
  //bool timelineModal = false;

  @override
  void initState() {
    // TODO: implement initState
    //rewardSelect();
    var random = math.Random();

    int i = random.nextInt(rewardList.length);
    setState(() {
      reward = rewardList[i];
    });
  }

  Future questStatus(int tree_id) async {
    final apiClient =
        ApiClient(basePath: 'https://cocoroiki-bff.yumekiti.net/api');
    final apiInstance = QuestStatusApi(apiClient);
    try {
      final response = await apiInstance.getQuestStatuses();
      print(response);
      //setState(() => queststatus = response);
      for (int i = 0; i < (response?.data)!.length; i++) {
        if (response?.data[i].attributes?.tree?.data?.id == tree_id) {
          if (response?.data[i].attributes?.doing == true) {
            return response?.data[i].id;
          }
        }
      }
      return null;
    } catch (e) {
      print(e);
    }
  }

  Future putQuestStatusData(status_id) async {
    final apiClient =
        ApiClient(basePath: 'https://cocoroiki-bff.yumekiti.net/api');
    final apiInstance = QuestStatusApi(apiClient);

    try {
      final newQuestStatus = QuestStatusRequest(
          data: QuestStatusRequestData(
        completedAt: DateTime.now(),
        doing: false,
        grandparent: AppUserRequestDataFamiliesInner(fields: {'id': 3}),
        tree: 1,
      ));
      final response =
          await apiInstance.putQuestStatusesId(status_id, newQuestStatus);
      print(response);
    } catch (e) {
      print(e);
    }
  }

  Future rewardSelect() async {
    print('リワードきた！');
    final apiClient =
        ApiClient(basePath: 'https://cocoroiki-bff.yumekiti.net/api');
    final apiInstance = RewardApi(apiClient);
    try {
      final response = await apiInstance.getRewards();

      print(response);
      //setState(() => queststatus = response);
      for (int i = 0; i < (response?.data)!.length; i++) {
        if (response?.data[i].attributes?.user == 1) {
          setState(() {
            rewardList.add((response?.data[i].attributes?.name)!);
          });
        }
      }
      var random = math.Random();

      int i = random.nextInt(rewardList.length);
      setState(() {
        reward = rewardList[i];
      });
      print(reward);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );

    return SingleChildScrollView(
      child: WillPopScope(
          onWillPop: () {
            Navigator.pop(context, true);
            return Future.value(false);
          },
          child: Dialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              alignment: Alignment.center,
              insetPadding: EdgeInsets.only(
                bottom: 0,
                top: json ? 0 : 240,
                left: 0,
                right: 0,
              ),
              child: !present
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset(
                                'assets/svg/quest_check_board.svg'),
                            !checkModal
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Text(
                                            'クエストチェック',
                                            style: TextStyle(
                                              fontSize: 25,
                                              fontFamily: 'Zen-B',
                                              foreground: Paint()
                                                ..style = PaintingStyle.stroke
                                                ..strokeWidth = 5
                                                ..color = Color(0xFF835237),
                                            ),
                                          ),
                                          Text(
                                            'クエストチェック',
                                            style: TextStyle(
                                              fontFamily: 'Zen-B',
                                              fontSize: 25,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 28),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/svg/check_word.svg'),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 24),
                                            child: TextField(
                                              onChanged: (value) {
                                                setState(() {
                                                  //controller.text = value;
                                                });
                                              },
                                              textAlign: TextAlign.center,
                                              controller: controller,
                                              //autofocus: true,
                                              //focusNode: _focusNode,
                                              textInputAction:
                                                  TextInputAction.next,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: kFontColor,
                                                  fontFamily: 'Zen-B'),
                                              //cursorColor: kFontColor,
                                              showCursor: true,

                                              //keyboardType: TextInputType.emailAddress,
                                              decoration: const InputDecoration(
                                                hintText: '合言葉を入力',
                                                hintStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Zen-M'),
                                                contentPadding:
                                                    EdgeInsets.only(left: 24),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                : Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Text(
                                        //timelineModal
                                        //? 'タイムラインで投稿\nしましょう！'
                                        'クエストクリア\nしましたか？',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 27,
                                          fontFamily: 'Zen-B',
                                          foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = 5
                                            ..color = Color(0xFF835237),
                                        ),
                                      ),
                                      Text(
                                        //timelineModal
                                        //? 'タイムラインで投稿\nしましょう！'
                                        'クエストクリア\nしましたか？',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Zen-B',
                                          fontSize: 27,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                            !checkModal
                                ? Positioned(
                                    top: -16,
                                    right: 16,
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: SvgPicture.asset(
                                            'assets/svg/quest_batsu.svg')))
                                : Container()
                          ],
                        ),
                        SizedBox(height: 23),
                        !checkModal
                            ? GestureDetector(
                                onTap: () {
                                  print(controller.text.isNotEmpty);
                                  if (controller.text.isNotEmpty) {
                                    setState(() {
                                      checkModal = true;
                                    });
                                  }
                                },
                                child: controller.text.isNotEmpty
                                    ? Stack(
                                        alignment: Alignment.center,
                                        children: [
                                            SvgPicture.asset(
                                                'assets/svg/next_push.svg'),
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Text(
                                                  '次へ',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: 'Zen-B',
                                                    foreground: Paint()
                                                      ..style =
                                                          PaintingStyle.stroke
                                                      ..strokeWidth = 4.5
                                                      ..color = kshadoeColor,
                                                  ),
                                                ),
                                                Text(
                                                  '次へ',
                                                  style: TextStyle(
                                                    fontFamily: 'Zen-B',
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ])
                                    : Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/svg/next_nopush.svg'),
                                          Text(
                                            '次へ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          )
                                        ],
                                      ))
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GrandRoomScreen2()));
                                    },
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/svg/next_push.svg'),
                                          Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Text(
                                                //timelineModal ? 'あとで'
                                                'まだ！',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Zen-B',
                                                  foreground: Paint()
                                                    ..style =
                                                        PaintingStyle.stroke
                                                    ..strokeWidth = 4.5
                                                    ..color = kshadoeColor,
                                                ),
                                              ),
                                              Text(
                                                //timelineModal ? 'あとで'
                                                'まだ！',
                                                style: TextStyle(
                                                  fontFamily: 'Zen-B',
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          )
                                        ]),
                                  ),
                                  SizedBox(
                                    width: 24,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (false) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PostScreen()));
                                      } else {
                                        questStatus(1).then((value) {
                                          putQuestStatusData(value);
                                        });
                                        setState(() {
                                          present = true;
                                          json = true;
                                        });
                                        Future.delayed(
                                            Duration(milliseconds: 2600), () {
                                          setState(() {
                                            presentFlag = 1;
                                            json = false;
                                          });
                                        });
                                      }
                                    },
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/svg/next_push.svg'),
                                          Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Text(
                                                //timelineModal ? 'タイムラインへ' :
                                                'クリア',
                                                style: TextStyle(
                                                  fontSize: //timelineModal ? 17 :
                                                      20,
                                                  fontFamily: 'Zen-B',
                                                  foreground: Paint()
                                                    ..style =
                                                        PaintingStyle.stroke
                                                    ..strokeWidth = 4.5
                                                    ..color = kshadoeColor,
                                                ),
                                              ),
                                              Text(
                                                //timelineModal ? 'タイムラインへ' :
                                                'クリア',
                                                style: TextStyle(
                                                  fontFamily: 'Zen-B',
                                                  fontSize: //timelineModal ? 17
                                                      20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          )
                                        ]),
                                  )
                                ],
                              )
                      ],
                    )
                  : presentFlag == 0
                      ? SizedBox(
                          height: deviceH,
                          child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: SizedBox(
                                  width: deviceW,
                                  child: Lottie.asset(
                                      'assets/json/Balloon_framein.json'))))
                      : presentFlag == 1
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  presentFlag = 2;
                                });
                                Future.delayed(Duration(milliseconds: 2250),
                                    () {
                                  setState(() {
                                    presentFlag = 3;
                                  });
                                });
                              },
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Text(
                                        'おかあさんといっしょに\nプレゼントをタッチしてね',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          height: 1.2,
                                          fontSize: 24,
                                          fontFamily: 'Zen-B',
                                          foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = 4
                                            ..color = Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'おかあさんといっしょに\nプレゼントをタッチしてね',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            height: 1.2,
                                            fontFamily: 'Zen-B',
                                            fontSize: 24,
                                            color: Color(0xFF40210F)),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      Lottie.asset(
                                          'assets/json/present (2).json'),
                                      Positioned(
                                          right: deviceW * 0.009,
                                          top: deviceH * 0.28,
                                          child: Lottie.asset(
                                              'assets/json/touch.json'))
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : presentFlag == 2
                              ? Align(
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          mokumoku = true;
                                        });
                                        Future.delayed(
                                            Duration(milliseconds: 1800), () {
                                          setState(() {
                                            rewardSelect().then((value) {
                                              mokumoku = false;
                                              result = true;
                                            });
                                          });
                                          // });
                                        });
                                      },
                                      child: Lottie.asset(
                                          'assets/json/present_open (2).json')))
                              : Column(
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Stack(
                                          clipBehavior: Clip.none,
                                          alignment: Alignment.center,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/svg/present_result_board.svg'),
                                            Positioned(
                                                top: -24,
                                                child: SvgPicture.asset(
                                                    'assets/svg/ribon.svg')),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text('レア度',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily: 'Zen-B',
                                                            fontSize: 24)),
                                                    SizedBox(width: 5),
                                                    Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                            'assets/svg/star_yellow.svg'),
                                                        SvgPicture.asset(
                                                            'assets/svg/star_grey.svg'),
                                                        SvgPicture.asset(
                                                            'assets/svg/star_grey.svg'),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                SizedBox(height: 14),
                                                SvgPicture.asset(
                                                    'assets/svg/kozukai.svg'),
                                                SizedBox(height: 14),
                                                Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Text(
                                                      reward,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        height: 1.2,
                                                        fontSize: 24,
                                                        fontFamily: 'Zen-B',
                                                        foreground: Paint()
                                                          ..style =
                                                              PaintingStyle
                                                                  .stroke
                                                          ..strokeWidth = 5
                                                          ..color =
                                                              Color(0xFF562B13),
                                                      ),
                                                    ),
                                                    Text(
                                                      reward,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          height: 1.2,
                                                          fontFamily: 'Zen-B',
                                                          fontSize: 24,
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Positioned(
                                                top: 160,
                                                left: 130,
                                                child: SvgPicture.asset(
                                                    'assets/svg/kirakira.svg')),
                                            Positioned(
                                                top: 120,
                                                left: 110,
                                                child: SvgPicture.asset(
                                                    'assets/svg/kirakira.svg')),
                                            Positioned(
                                                top: 200,
                                                right: 110,
                                                child: SvgPicture.asset(
                                                    'assets/svg/kirakira.svg')),
                                            Positioned(
                                                top: 100,
                                                right: 120,
                                                child: SvgPicture.asset(
                                                    'assets/svg/kirakira.svg')),
                                          ],
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          present = false;
                                          //Navigator.pop(context);
                                          Navigator.of(context).pop(true);
                                          //timelineModal = true;
                                        });
                                      },
                                      child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/svg/next_push.svg'),
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Text(
                                                  'とじる',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: 'Zen-B',
                                                    foreground: Paint()
                                                      ..style =
                                                          PaintingStyle.stroke
                                                      ..strokeWidth = 4.5
                                                      ..color = kshadoeColor,
                                                  ),
                                                ),
                                                Text(
                                                  'とじる',
                                                  style: TextStyle(
                                                    fontFamily: 'Zen-B',
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ]),
                                    )
                                  ],
                                ))),
    );
  }
}
