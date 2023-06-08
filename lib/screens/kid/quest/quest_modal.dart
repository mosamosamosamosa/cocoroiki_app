import 'package:cocoroiki_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuestModal extends StatefulWidget {
  const QuestModal({super.key});

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
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 222,
              child: Text(
                'おばあちゃんと〇〇をしよう！',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kQuestfontColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
