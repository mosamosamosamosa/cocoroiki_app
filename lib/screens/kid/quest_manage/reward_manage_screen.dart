import 'package:cocoroiki_app/components/custom_app_bar.dart';
import 'package:cocoroiki_app/components/grid_item.dart';
import 'package:cocoroiki_app/components/reward_box.dart';
import 'package:cocoroiki_app/data/database.dart';
import 'package:cocoroiki_app/screens/kid/quest_manage/reward_add_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

class RewardManageScreen extends StatefulWidget {
  const RewardManageScreen({super.key});

  @override
  State<RewardManageScreen> createState() => _RewardManageScreenState();
}

class _RewardManageScreenState extends State<RewardManageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Image.asset('assets/image/back_check.png'),
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 140),
            Center(
              child: Text(
                '項目を長押しするとごほうびを削除できます',
                style: TextStyle(
                    fontFamily: 'Zen-B',
                    color: Color(0xFFED5500),
                    fontSize: 14),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 29),
                  child: Row(
                    children: [
                      Text(
                        'レア度',
                        style: TextStyle(
                            color: Color(0xFF2F1A09),
                            fontFamily: 'Zen-B',
                            fontSize: 16),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                              'assets/svg/gohoubi_star_yellow.svg'),
                          SvgPicture.asset('assets/svg/gohoubi_star_grey.svg'),
                          SvgPicture.asset('assets/svg/gohoubi_star_grey.svg'),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                    height: 120,
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 24,
                        right: 24,
                        bottom: 10,
                      ),
                      childAspectRatio: 1.2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      crossAxisCount: 3,
                      children: List.generate(
                        reward1_list.length + 1,
                        ((index) => index == reward1_list.length
                            ? GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RewardAddScreen()));
                                },
                                child:
                                    RewardBox(title: '', icon: '', add: true))
                            : RewardBox(
                                title: reward1_list[index].title,
                                icon: reward1_list[index].icon,
                                add: false,
                              )),
                      ),
                    ))
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 29),
                  child: Row(
                    children: [
                      Text(
                        'レア度',
                        style: TextStyle(
                            color: Color(0xFF2F1A09),
                            fontFamily: 'Zen-B',
                            fontSize: 16),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                              'assets/svg/gohoubi_star_yellow.svg'),
                          SvgPicture.asset(
                              'assets/svg/gohoubi_star_yellow.svg'),
                          SvgPicture.asset('assets/svg/gohoubi_star_grey.svg'),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                    height: 240,
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 24,
                        right: 24,
                        bottom: 10,
                      ),
                      childAspectRatio: 1.2,
                      mainAxisSpacing: 18,
                      crossAxisSpacing: 0,
                      crossAxisCount: 3,
                      children: List.generate(
                        reward2_list.length + 1,
                        ((index) => index == reward2_list.length
                            ? GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RewardAddScreen()));
                                },
                                child:
                                    RewardBox(title: '', icon: '', add: true))
                            : RewardBox(
                                title: reward2_list[index].title,
                                icon: reward2_list[index].icon,
                                add: false,
                              )),
                      ),
                    ))
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 29),
                  child: Row(
                    children: [
                      Text(
                        'レア度',
                        style: TextStyle(
                            color: Color(0xFF2F1A09),
                            fontFamily: 'Zen-B',
                            fontSize: 16),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                              'assets/svg/gohoubi_star_yellow.svg'),
                          SvgPicture.asset(
                              'assets/svg/gohoubi_star_yellow.svg'),
                          SvgPicture.asset(
                              'assets/svg/gohoubi_star_yellow.svg'),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                    height: 240,
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 24,
                        right: 24,
                        bottom: 10,
                      ),
                      childAspectRatio: 1.2,
                      mainAxisSpacing: 18,
                      crossAxisSpacing: 0,
                      crossAxisCount: 3,
                      children: List.generate(
                        reward2_list.length + 1,
                        ((index) => index == reward3_list.length
                            ? GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RewardAddScreen()));
                                },
                                child:
                                    RewardBox(title: '', icon: '', add: true))
                            : RewardBox(
                                title: reward3_list[index].title,
                                icon: reward3_list[index].icon,
                                add: false,
                              )),
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
      CustomAppBar(title: 'ご褒美管理', reading: 'reading_batsu.svg'),
    ]));
  }
}
