import 'package:flutter/material.dart';

class ImageModal extends StatelessWidget {
  const ImageModal({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        alignment: Alignment.center,
        insetPadding: const EdgeInsets.only(
          bottom: 200,
          top: 200,
          left: 0,
          right: 0,
        ),
        child: Image.network(image));
  }
}
