// import 'package:cocoroiki_app/components/buttom_bar.dart';
// import 'package:cocoroiki_app/constants.dart';
// import 'package:cocoroiki_app/screens/grandparent/home_screen.dart';
// import 'package:cocoroiki_app/screens/grandparent/timeline/timeline_screen.dart';
// import 'package:cocoroiki_app/screens/kid/quest/quest_screen.dart';
// import 'package:cocoroiki_app/screens/kid/timelinekids.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// //SNSによくあるButtomNavigation
// //全画面に共通しているアイテムをおく
// class Screen extends StatefulWidget {
//   const Screen({super.key});

//   @override
//   State<Screen> createState() => _ScreenState();
// }

// class _ScreenState extends State<Screen> {
//   //どのページを選択しているか
//   int selectedIndex = 0;
//   //選択する可能性のあるページ
//   List<Widget> pageList = const [
//     Timelinekids(),
//     QuestScreen(),
//     HomeScreen(),
//   ];

//   bool pushed1 = false;
//   bool pushed2 = false;
//   bool pushed3 = false;
//   @override
//   Widget build(BuildContext context) {
//     double deviceW = MediaQuery.of(context).size.width;
//     double deviceH = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: Stack(
//         children: [
//           pageList[selectedIndex],
//           Positioned(
//             bottom: 64,
//             left: 0,
//             right: 0,
//             child: Row(
//               children: [
//                 SizedBox(width: 65),
//                 GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         pushed1 = true;
//                         pushed2 = false;
//                         pushed3 = false;
//                         selectedIndex = 0;
//                       });
//                     },
//                     child: ButtomBar(
//                         pushed: pushed1, icon: 'clock.svg', title: 'タイムライン')),
//                 SizedBox(width: 24),
//                 GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         pushed1 = false;
//                         pushed2 = true;
//                         pushed3 = false;
//                         selectedIndex = 1;
//                       });
//                     },
//                     child: ButtomBar(
//                       pushed: pushed2,
//                       icon: 'tree_icon.svg',
//                       title: 'ひろば',
//                     )),
//                 SizedBox(width: 24),
//                 GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         pushed1 = false;
//                         pushed2 = false;
//                         pushed3 = true;
//                         selectedIndex = 2;
//                       });
//                     },
//                     child: ButtomBar(
//                       pushed: pushed3,
//                       icon: 'book_icon.svg',
//                       title: 'クエスト',
//                     )),
//                 SizedBox(width: 65),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
