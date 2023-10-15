import 'package:cocoroiki_app/screens/grandparent/grandchild_room.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//呼び出し questClear true:クエスト終了時 false:クエスト開始時
//  showDialog(
//                                   barrierDismissible: false,
//                                   context: context,
//                                   builder: (BuildContext context) =>
//                                       QuestPushMpdal(
//                                         questClear: false,
//                                       ));

class QuestPushMpdal extends StatefulWidget {
  const QuestPushMpdal({super.key, required this.questClear});

  //クエスト終了した時
  final bool questClear;

  @override
  State<QuestPushMpdal> createState() => _QuestPushMpdalState();
}

class _QuestPushMpdalState extends State<QuestPushMpdal> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      alignment: Alignment.center,
      insetPadding: const EdgeInsets.only(
        bottom: 0,
        top: 220,
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset('assets/image/quest_push_back.png'),
              Visibility(
                visible: widget.questClear,
                child: Positioned(
                    top: -40,
                    left: 0,
                    right: 0,
                    child: Image.asset('assets/image/push_quest_clear.png')),
              ),
              Column(
                children: [
                  SizedBox(height: 28),
                  Visibility(
                    visible: !widget.questClear,
                    child: Text(
                      '現在のクエスト',
                      style: TextStyle(
                          fontFamily: 'Zen-M',
                          //fontWeight: FontWeight.bold,
                          color: Color(0xFF6D6663),
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(height: widget.questClear ? 20 : 10),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        "おさんぽにいこう！",
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
                          fontSize: 28,
                          fontFamily: 'Zen-B',
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 3
                            ..color = Colors.white,
                        ),
                      ),
                      Text(
                        "おさんぽにいこう！",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 1.2,
                          fontFamily: 'Zen-B',
                          fontSize: 28,
                          color: Color(0xFF511C0B),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  SvgPicture.asset('assets/svg/quest_push_border.svg'),
                  //SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.all(26),
                    child: Text(
                      'ゆうとくんがクエストを開始しました。水やりで応援しましょう！',
                      style: TextStyle(
                          fontFamily: 'Zen-B',
                          //fontWeight: FontWeight.bold,
                          color: Color(0xFF511C0B),
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 22,
          ),
          GestureDetector(
            onTap: () {
              if (widget.questClear) {
                Navigator.pop(context);
              }
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            GrandchildScreen(questClose: false)));
              }
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset('assets/svg/quest_push_yell.svg'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.questClear
                        ? Image.asset('assets/image/push_close_icon.png')
                        : Image.asset('assets/image/push_yell_icon.png'),
                    SizedBox(width: 10),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          widget.questClear ? '閉じる' : '応援する',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Zen-B',
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 5
                              ..color = Color(0xFF553628),
                          ),
                        ),
                        Text(
                          widget.questClear ? '閉じる' : '応援する',
                          style: TextStyle(
                            fontFamily: 'Zen-B',
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
