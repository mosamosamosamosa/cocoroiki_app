// import 'package:cocoroiki_app/constants.dart';
// import 'package:cocoroiki_app/screens/grandparent/timeline/albam_screen.dart';
// import 'package:cocoroiki_app/screens/grandparent/timeline/timeline_screen.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<Widget> pageList = [TimelineScreen(), AlbamScreen()];
//   int selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     TabController _tabController;

//     return DefaultTabController(
//       initialIndex: 0,
//       length: 2,
//       child: Scaffold(
//           appBar: AppBar(
//             elevation: 1.0,
//             backgroundColor: kAppBarColor,
//             bottom: const TabBar(
//               labelColor: kFontColor,
//               unselectedLabelColor: kNonTabSelectColor,
//               indicatorColor: Colors.black,
//               tabs: [
//                 Tab(
//                   child: Text(
//                     "タイムライン",
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                   ),
//                 ),
//                 Tab(
//                   child: Text(
//                     "アルバム",
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           body: TabBarView(
//             children: [pageList[0], pageList[1]],
//           )),
//     );
//   }
// }
