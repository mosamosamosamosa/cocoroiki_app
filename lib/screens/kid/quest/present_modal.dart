import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PresentModal extends StatefulWidget {
  const PresentModal({super.key});

  @override
  State<PresentModal> createState() => _PresentModalState();
}

class _PresentModalState extends State<PresentModal> {
  bool open = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      alignment: Alignment.center,
      insetPadding: const EdgeInsets.only(
        bottom: 0,
        top: 0,
        left: 0,
        right: 0,
      ),
      child: GestureDetector(
          onTap: () {
            setState(() {
              open = true;
            });
          },
          child: open
              ? Lottie.asset('assets/json/present_open.json')
              : Lottie.asset('assets/json/present.json')),
    );
  }
}
