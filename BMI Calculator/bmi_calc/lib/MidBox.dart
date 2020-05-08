import 'package:flutter/material.dart';

class MidBox extends StatelessWidget {
  MidBox(this.hexcolor, this.child);

  final int hexcolor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        color: Color(hexcolor),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
