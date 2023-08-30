import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;
  const TitleText(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
        child: Text(title),
        style: const TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.bold,
        ));
  }
}
