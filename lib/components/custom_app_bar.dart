import 'package:cocoroiki_app/data/database.dart';
import 'package:cocoroiki_app/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key, required this.title, required this.reading});
  final String title;
  final String reading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userRoleState = ref.watch(userRoleProvider);
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset('assets/svg/app_bar.svg'),
        Positioned(
          top: userRoleState ? 72 : 78,
          child: Text(title,
              style: TextStyle(
                  fontSize: userRoleState ? 24 : 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
        Positioned(
            top: 80,
            left: 20,
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset('assets/svg/$reading'))),
      ],
    );
  }
}
