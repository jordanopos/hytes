import 'package:flutter/material.dart';

class DisplayPhoto extends StatelessWidget {
  final String imgUrl;

  DisplayPhoto(this.imgUrl);
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: MediaQuery.of(context).size.width,
      child: Image(
          fit: BoxFit.cover, image: AssetImage('$imgUrl')),
    );
  }
}
