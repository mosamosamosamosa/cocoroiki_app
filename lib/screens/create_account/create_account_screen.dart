import 'package:cocoroiki_app/components/app_button.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  String userName = '';
  bool userFlag = true;
  bool motherFlag = false;
  bool fatherFlag = false;
  bool grandmotherFlag = false;
  bool grandfatherFlag = false;

  @override
  Widget build(BuildContext context) {
    List<String> relational = ['ママ', 'パパ', 'おばあちゃん', 'おじいちゃん'];
    //bool isNull = true;
    final controllerN = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 115,
        backgroundColor: kAppBarColor,
        leading: Column(
          children: [
            SizedBox(height: 72),
            Icon(Icons.arrow_back_ios, color: Colors.white // アイコンの色を設定できる
                ),
          ],
        ),
        title: Column(
          children: [
            SizedBox(height: 50),
            Text('アカウント作成',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(height: 36, color: Color(0xFF7BAB4A)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 7,
                        decoration: BoxDecoration(
                          color: Color(0xFFFCCC00),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        width: 18,
                        height: 7,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        width: 18,
                        height: 7,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        width: 18,
                        height: 7,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 40),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF848484), width: 2),
                      color: Color(0xFFD0D0D0),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SvgPicture.asset('assets/svg/human_icon.svg')
                ],
              ),
              SizedBox(height: 8),
              Text('プロフィール画像',
                  style: TextStyle(
                      color: Color(0xFF747474),
                      fontWeight: FontWeight.bold,
                      fontSize: 12)),
              SizedBox(height: 24),
              Container(
                width: 310,
                height: 50,
                //color: isNull ? Color(0x90C659) : Colors.transparent,
                decoration: BoxDecoration(
                  color: userFlag ? Color(0xFFE9E9E9) : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: userFlag ? Colors.transparent : Color(0xFF90C659),
                      width: 2),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      onTap: () {
                        print('タップは検知できたよ');
                        setState(() {
                          userFlag = false;
                        });
                        print(userFlag);
                      },
                      //controller:
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            userName = value;
                          });
                        } else {
                          setState(() {
                            userName = '';
                          });
                        }
                      },
                      style: TextStyle(
                        color: userFlag ? Color(0xFF747474) : Color(0xFF511C0B),
                        fontSize: 15,
                        fontFamily: 'Zen-B',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        height: 1.25,
                        letterSpacing: -0.5,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'お名前',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: 310,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFE9E9E9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '生年月日',
                      style: TextStyle(
                        color: true ? Color(0xFF511C0B) : Color(0xFF747474),
                        fontSize: 15,
                        fontFamily: true ? 'Zen-B' : 'Zen-m',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        height: 1.25,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  SizedBox(width: 40),
                  Text('お子様との関係',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF747474),
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, top: 16),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            motherFlag = true;
                            fatherFlag = false;
                            grandmotherFlag = false;
                            grandfatherFlag = false;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 105,
                          height: 50,
                          decoration: BoxDecoration(
                            color:
                                motherFlag ? Colors.white : Color(0xFFE9E9E9),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: motherFlag
                                    ? Color(0xFF90C659)
                                    : Colors.transparent,
                                width: 2),
                          ),
                          child: Text(
                            'ママ',
                            style: TextStyle(
                              fontSize: 14,
                              color: motherFlag
                                  ? Color(0xFF511C0B)
                                  : Color(0xFF747474),
                              fontFamily: 'Zen-B',
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            motherFlag = false;
                            fatherFlag = true;
                            grandmotherFlag = false;
                            grandfatherFlag = false;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 105,
                          height: 50,
                          decoration: BoxDecoration(
                            color:
                                fatherFlag ? Colors.white : Color(0xFFE9E9E9),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: fatherFlag
                                    ? Color(0xFF90C659)
                                    : Colors.transparent,
                                width: 2),
                          ),
                          child: Text(
                            'パパ',
                            style: TextStyle(
                              fontSize: 14,
                              color: fatherFlag
                                  ? Color(0xFF511C0B)
                                  : Color(0xFF747474),
                              fontFamily: 'Zen-B',
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            motherFlag = false;
                            fatherFlag = false;
                            grandmotherFlag = true;
                            grandfatherFlag = false;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 105,
                          height: 50,
                          decoration: BoxDecoration(
                            color: grandmotherFlag
                                ? Colors.white
                                : Color(0xFFE9E9E9),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: grandmotherFlag
                                    ? Color(0xFF90C659)
                                    : Colors.transparent,
                                width: 2),
                          ),
                          child: Text(
                            'おばあちゃん',
                            style: TextStyle(
                              fontSize: 14,
                              color: grandmotherFlag
                                  ? Color(0xFF511C0B)
                                  : Color(0xFF747474),
                              fontFamily: 'Zen-B',
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            motherFlag = false;
                            fatherFlag = false;
                            grandmotherFlag = false;
                            grandfatherFlag = true;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 105,
                          height: 50,
                          decoration: BoxDecoration(
                            color: grandfatherFlag
                                ? Colors.white
                                : Color(0xFFE9E9E9),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: grandfatherFlag
                                    ? Color(0xFF90C659)
                                    : Colors.transparent,
                                width: 2),
                          ),
                          child: Text(
                            'おじいちゃん',
                            style: TextStyle(
                              fontSize: 14,
                              color: grandfatherFlag
                                  ? Color(0xFF511C0B)
                                  : Color(0xFF747474),
                              fontFamily: 'Zen-B',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
              bottom: 86,
              child: AppButton(
                text: '次へ',
                pushable: false,
                nopushColor: 0xFF9A9A9A,
                pushColor: 0xFFFCCC00,
              ))
        ],
      ),
    );
  }
}
