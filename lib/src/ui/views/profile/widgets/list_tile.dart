import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function onPressed;

  MyTile(this.title, this.iconData, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap :onPressed == null
            ? () {
                print(null);
              }
            : onPressed,
        child: ListTile(title: Text('$title'), leading: Icon(iconData)));
  }
}
