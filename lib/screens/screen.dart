import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/screens/home_screen.dart';
import 'package:cocoroiki_app/screens/quest/quest_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//SNSによくあるButtomNavigation
//全画面に共通しているアイテムをおく
class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  //どのページを選択しているか
  int selectedIndex = 0;
  //選択する可能性のあるページ
  List<Widget> pageList = const [
    HomeScreen(),
    QuestScreen(),
    HomeScreen(),
    QuestScreen()
  ];
  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: pageList[selectedIndex],
      bottomNavigationBar: SizedBox(
        height: deviceH * 0.13,
        child: BottomNavigationBar(
          selectedLabelStyle: TextStyle(fontSize: 12),
          // unselectedLabelStyle: TextStyle(backgroundColor: kFontColor),
          elevation: 10,

          backgroundColor: kAppBarColor,
          fixedColor: kFontColor,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: selectedIndex == 0
                    ? SvgPicture.asset('assets/svg/home.svg')
                    : SvgPicture.asset('assets/svg/home2.svg'),
                label: 'タイムライン'),
            BottomNavigationBarItem(
                icon: selectedIndex == 1
                    ? SvgPicture.asset('assets/svg/home.svg')
                    : SvgPicture.asset('assets/svg/home2.svg'),
                label: ''),
            BottomNavigationBarItem(
                icon: selectedIndex == 2
                    ? SvgPicture.asset('assets/svg/home.svg')
                    : SvgPicture.asset('assets/svg/home2.svg'),
                label: ''),
            BottomNavigationBarItem(
                icon: selectedIndex == 3
                    ? SvgPicture.asset('assets/svg/home.svg')
                    : SvgPicture.asset('assets/svg/home2.svg'),
                label: '')
          ],
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
