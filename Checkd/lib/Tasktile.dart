import 'package:flutter/material.dart';

class Tasktile extends StatelessWidget {
  Tasktile(this.task,this.check,this.onTap,this.onlongpress);
  
  final task;
  final check;
  final onTap;
  final onlongpress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: ListTile(
        onLongPress: onlongpress,
          leading: Text(
            task,
            style: TextStyle(color: Colors.black, fontSize: 24,decoration: check?TextDecoration.lineThrough:TextDecoration.none),
          ),
          trailing: Checkbox(value: check, onChanged: onTap),
        ),
    );
  }
}