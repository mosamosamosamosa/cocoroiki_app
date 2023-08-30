import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cocoroiki_app/constants.dart';
import 'package:cocoroiki_app/screens/kid/quest/quest_screen.dart';
import 'package:cocoroiki_app/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => LoginScreen()));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => QuestScreen()));
      },
      child: Container(
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
                      child: Container(
                        width: deviceW,
                        child: FittedBox(
                            fit: BoxFit.contain,
                            child: Image.asset('assets/image/start_back.png')),
                      )),
                  Positioned(
                      top: 280,
                      child: Image.asset('assets/image/cocoroiki.png')),
                  Positioned(
                      top: 200,
                      left: 24,
                      child: SvgPicture.asset('assets/svg/yousei.svg')),
                  Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      isRepeatingAnimation: true,
                      animatedTexts: [
                        FadeAnimatedText('画面をタッチしてスタート',
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Zen-B',
                                color: kFontColor)),
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}
