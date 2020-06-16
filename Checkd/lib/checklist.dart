
import 'package:flutter/material.dart';
import 'ToDoList.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'NewItem.dart';

class Checklist extends StatefulWidget {
  @override
  _ChecklistState createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: ActionAdd(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 80, left: 30, right: 30, bottom: 30),
                child: CircleAvatar(
                  maxRadius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.view_list,
                    color: Colors.lightBlueAccent,
                    size: 40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  "Checkd",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                    "${Provider.of<ListSheet>(context).list.length} Tasks",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400)),
              )
            ],
          ),
          SizedBox(height: 40),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      offset: Offset.fromDirection(1.57),
                      blurRadius: 1.2,
                      spreadRadius: 5)
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ToDolist(),
            ),
          ),
        ],
      ),
    );
  }
}

String task;

class ActionAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {
          showModalBottomSheet(
              // print(task);
              elevation: 15,
              context: (context),
              builder: (context) {
                return Container(
                  color: Color(0xFF757575),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset.fromDirection(1.57),
                            blurRadius: 1.2,
                            spreadRadius: 5)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          strutStyle: StrutStyle(
                            height: 0,
                          ),
                          style:
                              TextStyle(fontSize: 20, color: Colors.lightBlue),
                          autofocus: true,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            task = value;
                          },
                        ),
                        SizedBox(height: 30),
                        Container(
                         // width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  offset: Offset.fromDirection(1.57),
                                  blurRadius: 1.2,
                                  spreadRadius: 5)
                            ],
                          ),
                          child: FlatButton(
                            onPressed: () {
                              if (task != null) {
                                Provider.of<ListSheet>(context, listen: false)
                                    .extendlist(ListItem(task, false));
                                task = null;
                                Navigator.pop(context);
                              } else {
                                Navigator.pop(context);
                              }
                            },
                            child: Text(
                              "Add task",
                              style: TextStyle(
                                  color: Colors.lightBlueAccent, fontSize: 25),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
