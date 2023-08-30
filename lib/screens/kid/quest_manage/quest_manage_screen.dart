import 'package:cocoroiki_app/components/custom_app_bar.dart';
import 'package:cocoroiki_app/components/quest_history_item.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/data/database.dart';
import 'package:cocoroiki_app/screens/kid/quest_manage/reward_manage_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

class QuestManageScreen extends StatefulWidget {
  const QuestManageScreen({super.key});

  @override
  State<QuestManageScreen> createState() => _QuestManageScreenState();
}

class _QuestManageScreenState extends State<QuestManageScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(children: [
          Container(
              width: deviceW,
              child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.asset('assets/image/back_check.png'))),
          Positioned(
              bottom: 0,
              child: Container(
                  width: deviceW,
                  child: FittedBox(
                      fit: BoxFit.contain,
                      child: Image.asset('assets/image/fukidashi.png')))),
          CustomAppBar(title: 'クエスト', reading: 'reading_batsu.svg'),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 140),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(width: 10),
                    Column(
                      children: [
                        SizedBox(
                            height: 60,
                            width: 60,
                            child: CircleAvatar(
                                radius: 32,
                                foregroundImage:
                                    NetworkImage(users_list[1].image))),
                        Text(
                          'よしえ',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Zen-B',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                            height: 60,
                            width: 60,
                            child: Image.asset('assets/image/no_image.png')),
                        Text(
                          '未登録',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Zen-B',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                            height: 60,
                            width: 60,
                            child: Image.asset('assets/image/no_image.png')),
                        Text(
                          '未登録',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Zen-B',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                            height: 60,
                            width: 60,
                            child: Image.asset('assets/image/no_image.png')),
                        Text(
                          '未登録',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Zen-B',
                              fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              SizedBox(height: 60),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset('assets/svg/today_quest_border.svg'),
                  Positioned(
                    top: -10,
                    left: 0,
                    right: 0,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          'きょうのクエスト',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            shadows: <Shadow>[
                              Shadow(
                                color: Colors.grey,
                                offset: Offset(0, 3.0),
                                blurRadius: 3.0,
                              ),
                            ],
                            height: 1.2,
                            fontSize: 20,
                            fontFamily: 'Zen-Bl',
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = Colors.white,
                          ),
                        ),
                        Text(
                          'きょうのクエスト',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: 1.2,
                            fontFamily: 'Zen-B',
                            fontSize: 20,
                            color: Color(0xFF62510C),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'おさんぽにいこう！',
                    style: TextStyle(
                        color: Color(0xFF2F1A09),
                        fontFamily: 'Zen-B',
                        fontSize: 24),
                  ),
                ],
              ),
              SizedBox(
                height: 450,
                child: ListView.builder(
                    itemCount: quest_manage.length,
                    itemBuilder: (context, index) {
                      return QuestHistoryItem(
                          date: quest_manage[index].date,
                          title: quest_manage[index].title,
                          icon: quest_manage[index].icon,
                          gohoubi: quest_manage[index].gohoubi);
                    }),
              )
            ],
          ),
        ]),
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RewardManageScreen()));
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SvgPicture.asset('assets/svg/gohoubi_add.svg'),
              Positioned(
                bottom: 16,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      "ご褒美管理",
                      style: TextStyle(
                        fontSize: 11,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Color(0xFF3E0E0E),
                      ),
                    ),
                    const Text(
                      "ご褒美管理",
                      style: TextStyle(
                        //fontWeight: FontWeight.bol,
                        fontSize: 11,
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
