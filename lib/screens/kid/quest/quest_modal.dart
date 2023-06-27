import 'package:cocoroiki_app/components/sub_app_button.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuestModal extends StatefulWidget {
  const QuestModal({super.key, required this.start});

  final bool start;
  @override
  State<QuestModal> createState() => _QuestModalState();
}

class _QuestModalState extends State<QuestModal> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      alignment: Alignment.center,
      insetPadding: const EdgeInsets.only(
        bottom: 200,
        top: 200,
        left: 28,
        right: 28,
      ),
      child: Stack(
        children: [
          SvgPicture.asset('assets/svg/quest_board.svg'),
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'クエスト2',
                style: TextStyle(
                    fontFamily: 'Zen-B', color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(height: 100),
                SizedBox(
                  width: 222,
                  child: Text(
                    'おさんぽにいこう！',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Zen-B',
                      color: kQuestfontColor,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                SizedBox(
                  width: 255,
                  child: Text(
                    'いまはどんなおはながさいているかな？おばあちゃんとさがしてみてね！',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Zen-M',
                      color: kQuestfontColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 14,
              left: 96,
              right: 96,
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SubAppButton(
                    text: widget.start ? 'とじる' : 'スタート !',
                  )))
        ],
      ),
    );
  }
}
