import 'package:cocoroiki_app/components/app_button.dart';
import 'package:cocoroiki_app/components/buttom_bar.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'create_account_screen3.dart';
//import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:intl/intl.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class CreateAccountScreen2 extends StatefulWidget {
  const CreateAccountScreen2({super.key});

  @override
  State<CreateAccountScreen2> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen2> {
  List<Widget> itemList = [];
  String userName = '';
  bool userFlag = false;
  bool dateFlag = false;
  bool boyFlag = false;
  bool girlFlag = false;
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

  void addItemToList() {
    setState(() {
      itemList.add(_buildListItem(itemList.length + 1));
    });
  }

//----------追加するリストの中身-----------//
  Widget _buildListItem(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Row(
          children: [
            SizedBox(width: 40),
            Text('$index 人目',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Zen-m',
                  color: Color(0xFF747474),
                )),
          ],
        ),
        Container(
          width: 310,
          height: 50,
          decoration: BoxDecoration(
            color: userFlag ? Colors.white : Color(0xFFE9E9E9),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: userFlag ? Color(0xFF90C659) : Colors.transparent,
                width: 2),
          ),
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
                  fontFamily: 'Zen-m',
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
                  color: dateFlag ? Color(0xFF90C659) : Colors.transparent,
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
        SizedBox(height: 14),
        Row(
          children: [
            SizedBox(width: 40),
            Text('お子様の性別',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Zen-m',
                  color: Color(0xFF747474),
                )),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      girlFlag = true;
                      boyFlag = false;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      width: 105,
                      height: 50,
                      decoration: BoxDecoration(
                        color: girlFlag ? Colors.white : Color(0xFFE9E9E9),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: girlFlag
                                ? Color(0xFF90C659)
                                : Colors.transparent,
                            width: 2),
                      ),
                      child: Text(
                        '女の子',
                        style: TextStyle(
                          fontSize: 14,
                          color:
                              girlFlag ? Color(0xFF511C0B) : Color(0xFF747474),
                          fontFamily: 'Zen-B',
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      girlFlag = false;
                      boyFlag = true;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 105,
                    height: 50,
                    decoration: BoxDecoration(
                      color: boyFlag ? Colors.white : Color(0xFFE9E9E9),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color:
                              boyFlag ? Color(0xFF90C659) : Colors.transparent,
                          width: 2),
                    ),
                    child: Text(
                      '男の子',
                      style: TextStyle(
                        fontSize: 14,
                        color: boyFlag ? Color(0xFF511C0B) : Color(0xFF747474),
                        fontFamily: 'Zen-B',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: Color(0xFF90C659),
          thickness: 0.5,
          indent: 10,
          endIndent: 10,
        )
      ]),
    );
  }

//----------追加するリストの中身-----------//

  @override
  Widget build(BuildContext context) {
    double deviceH = MediaQuery.of(context).size.height;
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
                      ],
                    )
                  ],
                ),
                SizedBox(height: 44),
                Text(
                  'お子様の登録',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF511C0B),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //Listが追加される場所
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsetsDirectional.only(bottom: deviceH * 0.3),
                    itemCount: itemList.length,
                    itemBuilder: (context, index) {
                      return itemList[index];
                    },
                  ),
                )
              ],
            ),
          ),
          //-------ボタンを押してボタンを押してリストに追加する処理-------//
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.only(right: 14, bottom: 140),
            child: GestureDetector(
              onTap: () {
                // ボタンがタップされたときの処理を記述
                addItemToList();
                print('ボタンが押されたよ');
              },
              child: Image.asset('assets/image/child_add.png'),
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
                        builder: (context) => CreateAccountScreen3()),
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

  //日付選択ダイアログを表示する関数
  Future<void> ScrollDatePicker(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (selected != null && selected != _selectedDate) {
      setState(() {
        _selectedDate = selected;
      });
    }
  }
}
