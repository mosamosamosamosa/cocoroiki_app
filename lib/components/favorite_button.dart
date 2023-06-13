import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);
  @override
  FavoriteButtonState createState() => FavoriteButtonState();
}

class FavoriteButtonState extends State<FavoriteButton>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final String color;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      child: FloatingActionButton(
        onPressed: () {
          if (_controller.isCompleted) {
            _controller.reset();
            color = "0xFFFFBFBF";
          } else {
            _controller.forward();
            color = "0xFFD9D9D9";
          }
        },
        backgroundColor: Color(0xFFFFFFFF),
        child: SizedBox(
          child: Lottie.network(
            'https://assets1.lottiefiles.com/packages/lf20_ADzN7G.json',
            controller: _controller,
            repeat: true,
            onLoaded: (composition) {
              _controller.duration = composition.duration;
            },
          ),
        ),
      ),
    );
  }
}
