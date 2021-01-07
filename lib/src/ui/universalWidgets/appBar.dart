import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  final Widget trailing;

  MyAppBar({this.title, this.trailing});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(title,
          style: TextStyle(
              color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold)),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: trailing,
        )
      ],
    );
  }
}
