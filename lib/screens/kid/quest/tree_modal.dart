import 'package:cocoroiki_app/components/select_button.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/screens/kid/quest/grand_room_screen.dart';
import 'package:flutter/material.dart';

class TreeModal extends StatefulWidget {
  const TreeModal({super.key});

  @override
  State<TreeModal> createState() => _TreeModalState();
}

class _TreeModalState extends State<TreeModal> {
  bool selectedN = false;
  bool selectedY = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      alignment: Alignment.center,
      insetPadding: const EdgeInsets.only(
        bottom: 220,
        top: 220,
        left: 28,
        right: 28,
      ),
      child: Column(
        children: [
          const Text(
            '目の前におばあちゃんはいる？？',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedN = true;
                      selectedY = false;
                    });
                  },
                  child: SelectedButton(text: 'いない', pushed: selectedN)),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedN = false;
                      selectedY = true;
                    });
                  },
                  child: SelectedButton(text: 'いる', pushed: selectedY))
            ],
          ),
          SizedBox(height: 50),
          selectedN || selectedY
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GrandRoomScreen()));
                  },
                  child: Container(
                      alignment: Alignment.center,
                      child: Text('つぎへ'),
                      height: 56,
                      width: 142,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                      )),
                )
              : Container()
        ],
      ),
    );
  }
}
