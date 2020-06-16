import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'checklist.dart';
import 'NewItem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListSheet>(
      create: (context) {
        return ListSheet();
      },
      child: MaterialApp(
        home: Checklist(),
      ),
    );
  }
}

class ListSheet extends ChangeNotifier {
  List<ListItem> list = [];

  void extendlist(ListItem adder) {
    list.add(adder);
    notifyListeners();
  }

  void toggle(int index){
    //list[index].isChecked=!list[index].isChecked;
    list[index].toggle();
    notifyListeners();
  }
  void delete(index){
    list.removeAt(index);
    notifyListeners();
  }

}
