import 'package:cocoroiki_app/components/app_button.dart';
import 'package:cocoroiki_app/components/select_button.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/screens/kid/quest/grand_room_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TreeModal extends StatefulWidget {
  const TreeModal({super.key, required this.grandName, required this.gender});

  final String grandName;
  final String gender;
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
        bottom: 180,
        top: 250,
        left: 0,
        right: 0,
      ),
      child: Column(
        children: [
          const Text(
            'いま、おばあちゃんといっしょにいる？？',
            style: TextStyle(
                color: Colors.white, fontFamily: 'Zen-B', fontSize: 18),
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
          GestureDetector(
              onTap: () {
                if (selectedN || selectedY) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GrandRoomScreen(
                                grandName: widget.grandName,
                                gender: widget.gender,
                                questClose: true,
                                online: selectedN,
                              )));
                }
              },
              child: selectedN || selectedY
                  ? Stack(alignment: Alignment.center, children: [
                      SvgPicture.asset('assets/svg/next_push.svg'),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            'つぎへ',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Zen-B',
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 4.5
                                ..color = kshadoeColor,
                            ),
                          ),
                          Text(
                            'つぎへ',
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
                        SvgPicture.asset('assets/svg/next_nopush.svg'),
                        Text(
                          'つぎへ',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      ],
                    ))
        ],
      ),
    );
  }
}
