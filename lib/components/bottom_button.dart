import 'package:cocoroiki_app/components/buttom_bar.dart';
import 'package:cocoroiki_app/screens/kid/quest/quest_screen.dart';
import 'package:cocoroiki_app/screens/kid/timelinekids.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatefulWidget {
  const BottomButton({super.key});

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(width: 12),
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Timelinekids()));
            },
            child:
                ButtomBar(pushed: false, icon: 'clock.svg', title: 'タイムライン')),
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QuestScreen()));
            },
            child: const ButtomBar(
                pushed: false, icon: 'tree_icon.svg', title: 'ひろば')),
        GestureDetector(
            onTap: () {},
            child: const ButtomBar(
                pushed: false, icon: 'book_icon.svg', title: 'クエスト')),
        const SizedBox(width: 12),
      ],
    );
  }
}
