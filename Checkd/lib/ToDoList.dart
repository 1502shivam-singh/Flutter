import 'package:flutter/material.dart';
import 'Tasktile.dart';
import 'main.dart';
import 'package:provider/provider.dart';

class ToDolist extends StatefulWidget {
  @override
  _ToDolistState createState() => _ToDolistState();
}

class _ToDolistState extends State<ToDolist> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: Provider.of<ListSheet>(context).list.length,
      itemBuilder: (context, size) {
        return Tasktile(Provider.of<ListSheet>(context).list[size].task,
            Provider.of<ListSheet>(context).list[size].isChecked, (value) {
          Provider.of<ListSheet>(context, listen: false).toggle(size);
        },
        (){
          Provider.of<ListSheet>(context, listen: false).delete(size); 
        }
        );
      },
    );
  }
}
