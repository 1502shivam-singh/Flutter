import 'package:flutter/material.dart';

class LeftBox extends StatelessWidget {
  LeftBox(this.hexcolor, this.bottom, this.top, this.child);

  final int hexcolor;
  final double top;
  final Widget child;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.fromLTRB(10, top, 15, bottom),
      height: 200,
      width: 100,
      decoration: BoxDecoration(
        color: Color(hexcolor),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
