import 'package:cocoroiki_app/api_client/api.dart';
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
  List<String> reward1List = [];
  List<String> reward2List = [];
  List<String> reward3List = [];

  bool visi = false;

  Future getReward() async {
    final apiClient =
        ApiClient(basePath: 'https://cocoroiki-bff.yumekiti.net/api');
    final apiInstance = RewardApi(apiClient);
    try {
      final response = await apiInstance.getRewards();
      print('帰ってきた値:$response');

      if (response != null) {
        for (int i = 0; i < response.data.length; i++) {
          if (response.data[i].attributes?.point == 1) {
            setState(() {
              reward1List.add((response.data[i].attributes?.name)!);
              print('レア度１  :  $reward1List');
            });
          } else if (response.data[i].attributes?.point == 2) {
            setState(() {
              reward2List.add((response.data[i].attributes?.name)!);
              print('レア度２  :  $reward2List');
            });
          } else {
            setState(() {
              reward3List.add((response.data[i].attributes?.name)!);
              print('レア度３  :  $reward3List');
            });
          }
        }
      }
      //setState(() => {posts = response});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getReward();
  }

  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(children: [
      SizedBox(
          width: deviceW,
          child: FittedBox(
              fit: BoxFit.contain,
              child: Image.asset('assets/image/back_check.png'))),
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 140),
            Center(
              child: GestureDetector(
                onTap: () {
                  if (visi) {
                    setState(() {
                      visi = false;
                    });
                  }
                },
                child: Text(
                  visi ? '完了' : '項目を長押しするとごほうびを削除できます',
                  style: TextStyle(
                      fontFamily: 'Zen-B',
                      color: Color(0xFFED5500),
                      fontSize: 14),
                ),
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
                        reward1List.length + 1,
                        ((index) => index == reward1List.length
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
                            : GestureDetector(
                                onLongPress: () {
                                  setState(() {
                                    visi = true;
                                  });
                                },
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    RewardBox(
                                      title: reward1List[index],
                                      icon: reward1_list[index].icon,
                                      add: false,
                                    ),
                                    Visibility(
                                      visible: visi,
                                      child: Positioned(
                                        top: -8,
                                        right: 0,
                                        child: SizedBox(
                                          height: 32,
                                          width: 32,
                                          child: SvgPicture.asset(
                                              'assets/svg/reward_batsu_icon.svg'),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
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
                        reward2List.length + 1,
                        ((index) => index == reward2List.length
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
                            : GestureDetector(
                                onLongPress: () {
                                  setState(() {
                                    visi = true;
                                  });
                                },
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    RewardBox(
                                      title: reward2List[index],
                                      icon: reward2_list[index].icon,
                                      add: false,
                                    ),
                                    Visibility(
                                      visible: visi,
                                      child: Positioned(
                                        top: -8,
                                        right: 0,
                                        child: SizedBox(
                                          height: 32,
                                          width: 32,
                                          child: SvgPicture.asset(
                                              'assets/svg/reward_batsu_icon.svg'),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
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
                        reward2List.length + 1,
                        ((index) => index == reward3List.length
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
                            : GestureDetector(
                                onLongPress: () {
                                  setState(() {
                                    visi = true;
                                  });
                                },
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    RewardBox(
                                      title: reward3List[index],
                                      icon: reward3_list[index].icon,
                                      add: false,
                                    ),
                                    Visibility(
                                      visible: visi,
                                      child: Positioned(
                                        top: -8,
                                        right: 0,
                                        child: SizedBox(
                                          height: 32,
                                          width: 32,
                                          child: SvgPicture.asset(
                                              'assets/svg/reward_batsu_icon.svg'),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
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
