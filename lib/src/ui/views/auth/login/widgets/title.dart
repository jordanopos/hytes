import 'package:flutter/material.dart';

class OposTitle extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/images/hytes.jpeg'),),
        Text(
          'Hytes Edition',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
