import 'package:cocoroiki_app/api_client/api.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/provider/provider.dart';
import 'package:cocoroiki_app/screens/kid/quest/quest_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

AppUserListResponse userList = AppUserListResponse();
String email = '';

class _LoginScreenState extends ConsumerState<LoginScreen> {
  Future fetchSomeData(String eMail) async {
    bool flag = false;
    // 状態管理している値を操作できるようにする
    final userRoleNotifier = ref.watch(userRoleProvider.notifier);
    final apiClient =
        ApiClient(basePath: 'https://cocoroiki-bff.yumekiti.net/api');
    final apiInstance = AppUserApi(apiClient);
    try {
      final response = await apiInstance.getAppUsers();
      print(response);
      setState(() {
        userList = response!;
        for (int i = 0; i < userList.data.length; i++) {
          if (eMail == userList.data[i].attributes?.email) {
            flag = true;
            userRoleNotifier.state =
                (userList.data[i].attributes?.grandparent)!;
          }
        }
      });
      return flag;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: kBackgroundColors,
            stops: [
              0.3,
              0.6,
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset('assets/image/start_back.png')),
              Padding(
                padding: const EdgeInsets.only(top: 245),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'ログイン',
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Zen-Bl',
                          color: kFontColor),
                    ),
                    SizedBox(height: 41),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'メールアドレス',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Zen-B',
                              color: kFontColor),
                        ),
                        SizedBox(height: 6),
                        Container(
                          width: 310,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0.1,
                                  color: Colors.black12,
                                  spreadRadius: 1,
                                  offset: Offset(0, 1.5),
                                )
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              )),
                          child: Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TextField(
                                onTap: () {},
                                //controller:
                                onChanged: (value) {
                                  setState(() {
                                    email = value;
                                  });
                                },
                                style: TextStyle(
                                  color: Color(0xFF511C0B),
                                  fontSize: 15,
                                  fontFamily: 'Zen-B',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  height: 1.25,
                                  letterSpacing: -0.5,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  //hintText: 'お名前',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'パスワード',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Zen-B',
                              color: kFontColor),
                        ),
                        SizedBox(height: 6),
                        Container(
                          width: 310,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0.1,
                                  color: Colors.black12,
                                  spreadRadius: 1,
                                  offset: Offset(0, 1.5),
                                )
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              )),
                          child: Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TextField(
                                //伏字
                                obscureText: true,
                                onTap: () {},
                                //controller:
                                onChanged: (value) {},
                                style: TextStyle(
                                  color: Color(0xFF511C0B),
                                  fontSize: 15,
                                  fontFamily: 'Zen-B',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  height: 1.25,
                                  letterSpacing: -0.5,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  //hintText: 'お名前',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 228,
                child: GestureDetector(
                  onTap: () {
                    fetchSomeData(email).then((value) => {
                          if (value)
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QuestScreen()))
                            }
                        });
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/login_button.svg',
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            'ログイン',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Zen-B',
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 5
                                ..color = Color(0xFF835237),
                            ),
                          ),
                          Text(
                            'ログイン',
                            style: TextStyle(
                              fontFamily: 'Zen-B',
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 200,
                  left: 24,
                  child: SvgPicture.asset('assets/svg/yousei.svg')),
            ],
          ),
        ));
  }
}
