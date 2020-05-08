import 'package:flutter/material.dart';

class RightBox extends StatelessWidget {
  RightBox(this.hexcolor, this.bottom, this.top, this.child);

  final int hexcolor;
  final double top;
  final double bottom;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.fromLTRB(15, top, 10, bottom),
      height: 200,
      width: 100,
      decoration: BoxDecoration(
        color: Color(hexcolor),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}