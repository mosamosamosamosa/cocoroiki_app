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
  @override
  Widget build(BuildContext context) {
    List<String> relational = ['ママ', 'パパ', 'おばあちゃん', 'おじいちゃん'];
    return Scaffold(
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
                decoration: BoxDecoration(
                  color: Color(0xFFE9E9E9),
                  borderRadius: BorderRadius.circular(10),
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
              Flexible(
                child: SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: relational.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          width: 105,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFE9E9E9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Positioned(bottom: 86, child: AppButton(text: '次へ', pushable: false))
        ],
      ),
    );
  }
}
