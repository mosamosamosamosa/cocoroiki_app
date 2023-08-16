import 'package:cocoroiki_app/components/app_button.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/screens/create_account/create_account_screen4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreateAccountScreen3 extends StatefulWidget {
  const CreateAccountScreen3({super.key});

  @override
  State<CreateAccountScreen3> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen3> {
  FocusNode _textFieldFocusNode = FocusNode();
  String userName = '';
  bool userFlag = false;

  @override
  void dispose() {
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //TextEditingController textController = TextEditingController();

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
                      ],
                    )
                  ],
                ),
                SizedBox(height: 44),
                Text(
                  '合言葉設定',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF511C0B),
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                  child: Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        onTap: () {
                          _textFieldFocusNode.unfocus();
                          setState(() {
                            (value) {
                              if (value.isNotEmpty) {
                                setState(() {
                                  userName = value;
                                  userFlag = true;
                                });
                              } else {
                                setState(() {
                                  userName = '';
                                  userFlag = false;
                                });
                              }
                              ;
                            };
                          });
                          print(userFlag);
                        },
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              userName = value;
                              userFlag = true;
                            });
                          } else {
                            setState(() {
                              userName = '';
                              userFlag = false;
                            });
                          }
                        },
                        style: TextStyle(
                          color:
                              userFlag ? Color(0xFF511C0B) : Color(0xFF747474),
                          fontSize: 15,
                          fontFamily: userFlag ? 'Zen-B' : 'Zen-m',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          height: 1.25,
                          letterSpacing: -0.5,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '合言葉を設定しましょう',
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  // 表示位置を指定
                  padding: EdgeInsets.fromLTRB(40, 13, 40, 0),
                  child: Text('クエストクリアのチェックやご褒美を追加する時に使用する合言葉を決めてください',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF272727),
                        fontFamily: 'zen-m',
                      )),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                highlightColor: Color(0xE4BB0B),
                onTap: () {
                  Navigator.pop(context);
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
                      '戻る', // ボタンに表示するテキスト
                      style: TextStyle(
                        color: Colors.white, // テキストの色
                        fontSize: 16, // テキストのサイズ
                        fontWeight: FontWeight.bold, // テキストの太さ
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateAccountScreen4()),
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
