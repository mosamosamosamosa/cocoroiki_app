import 'dart:async';
import 'package:cocoroiki_app/components/app_button.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'create_account_screen2.dart';
//import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:intl/intl.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  String userName = '';
  bool userFlag = false;
  bool dateFlag = false;
  bool motherFlag = false;
  bool fatherFlag = false;
  bool grandmotherFlag = false;
  bool grandfatherFlag = false;
  DateTime? _selectedDate; // 選択された日付を保持
  bool isDatePickerVisible = false; // 日付ピッカーの表示を管理するフラグ

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (selected != null && selected != _selectedDate) {
      setState(() {
        _selectedDate = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //List<String> relational = ['ママ', 'パパ', 'おばあちゃん', 'おじいちゃん'];
    //bool isNull = true;
    //final controllerN = TextEditingController();

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
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/back_check.png'), // 画像のパスを指定
                fit: BoxFit.cover, // 画像を幅に合わせて表示
              ),
            ),
            child: Column(
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
                  decoration: BoxDecoration(
                    color: userFlag ? Colors.white : Color(0xFFE9E9E9),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color:
                            userFlag ? Color(0xFF90C659) : Colors.transparent,
                        width: 2),
                  ),

                  //************ 名前入力 *************//
                  child: Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        onTap: () {
                          setState(() {
                            userFlag = true;
                          });
                          print(userFlag);
                        },
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
                          color:
                              userFlag ? Color(0xFF511C0B) : Color(0xFF747474),
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

                //************ 生年月日入力 *************//
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Container(
                    width: 310,
                    height: 50,
                    decoration: BoxDecoration(
                      color: _selectedDate == null
                          ? Color(0xFF747474)
                          : dateFlag
                              ? Colors.white
                              : Color(0xFFE9E9E9),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color:
                              dateFlag ? Color(0xFF90C659) : Colors.transparent,
                          width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _selectedDate == null
                                ? "生年月日"
                                : DateFormat('yyyy年MM月dd日')
                                    .format(_selectedDate!), // 選択された日付をフォーマット
                            style: TextStyle(
                              color: _selectedDate == null
                                  ? Color(0xFF747474)
                                  : dateFlag
                                      ? Color(0xFF511C0B)
                                      : Color(0xFF747474),
                              fontSize: 15,
                              fontFamily: 'Zen-b',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              height: 1.25,
                              letterSpacing: -0.5,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_outlined, // 下矢印のアイコン
                            color: _selectedDate == null
                                ? Color(0xFF747474)
                                : dateFlag
                                    ? Color(0xFF511C0B)
                                    : Color(0xFF747474),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //************ 子供との関係入力 *************//
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
                    padding:
                        const EdgeInsets.only(left: 40, top: 16, right: 40),
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
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              alignment: Alignment.center,
                              width: 105,
                              height: 50,
                              decoration: BoxDecoration(
                                color: motherFlag
                                    ? Colors.white
                                    : Color(0xFFE9E9E9),
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
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              alignment: Alignment.center,
                              width: 105,
                              height: 50,
                              decoration: BoxDecoration(
                                color: fatherFlag
                                    ? Colors.white
                                    : Color(0xFFE9E9E9),
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
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
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
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
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
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 8),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateAccountScreen2()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 81),
                  width: 145,
                  height: 61,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/image/next_button.png'), // 画像のパスを指定
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '次へ', // ボタンに表示するテキスト
                      style: TextStyle(
                        color: Colors.white, //テキストの色
                        fontSize: 16, //テキストのサイズ
                        fontWeight: FontWeight.bold, //テキストの太さ
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
