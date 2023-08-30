import 'package:cocoroiki_app/components/app_button.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'create_account_screen.dart';

class CreateAccountScreen4 extends StatefulWidget {
  const CreateAccountScreen4({super.key});

  @override
  State<CreateAccountScreen4> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen4> {
  List<String> tagList = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p'
  ];

  List<String> selectedTags = [];

  Widget build(BuildContext context) {
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
                  '表示しないクエストのタグを選択してください',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF511C0B),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SingleChildScrollView(
                  child: ButtonGrid(tagList, selectedTags, (selectedTags) {
                    setState(() {
                      this.selectedTags = selectedTags;
                    });
                  }),
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
                        builder: (context) => CreateAccountScreen()),
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

class ButtonGrid extends StatelessWidget {
  final List<String> tagList;
  final List<String> selectedTags;
  final Function(List<String>) onSelectionChanged;

  ButtonGrid(this.tagList, this.selectedTags, this.onSelectionChanged);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 112 / 50,
      ),
      itemCount: tagList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final isSelected = selectedTags.contains(tagList[index]);
        return Container(
          margin: const EdgeInsets.all(8), // ボタンの周りの余白を設定
          child: ElevatedButton(
            onPressed: () {
              if (isSelected) {
                selectedTags.remove(tagList[index]);
              } else {
                selectedTags.add(tagList[index]);
              }
              onSelectionChanged(selectedTags);
            },
            style: ElevatedButton.styleFrom(
              primary: isSelected ? Color(0xFFFFFFFF) : Color(0xFFCACACA),
              side: BorderSide(
                color: isSelected
                    ? Color(0xFF90C659)
                    : Color(0xFFCACACA), // ボーダーの色を設定
              ),
            ),
            child: Text(
              tagList[index],
              style: TextStyle(
                color: isSelected
                    ? Color(0xFF511C0B)
                    : Color(0xFF747474), // テキストの色を設定
                fontSize: 15, // テキストのフォントサイズを設定
                fontFamily: isSelected ? 'zen-b' : 'zen-m', // テキストの太さを設定
                inherit: true,
              ),
            ),
          ),
        );
      },
    );
  }
}
