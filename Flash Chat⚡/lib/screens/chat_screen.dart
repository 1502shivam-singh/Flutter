import 'package:flash_chat/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _auth = FirebaseAuth.instance;
final _firebase = Firestore.instance;
String input;
String email;

class ChatScreen extends StatefulWidget {
  static String id = "/";
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FirebaseUser currentUser;

  void getCurrUser() async {
    try {
      if (_auth.currentUser() != null) {
        currentUser = await _auth.currentUser();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrUser();
  }

  TextEditingController _control = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pushNamed(context, LoginScreen.id);
                //Implement logout functionality
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: _firebase
                  .collection("messages")
                  .orderBy("time", descending: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.blueAccent,
                    ),
                  );
                }
                var messages = snapshot.data.documents.reversed;
                List<BubbleShape> chats = [];
                for (var messages in messages) {
                  String text = messages.data["text"];
                  String email = messages.data["email"];

                  bool isCurr = currentUser.email == email;
                  chats.add(
                    BubbleShape(text, email, isCurr),
                  );
                }
                return Expanded(
                  child: ListView(
                    reverse: true,
                    children: chats,
                  ),
                );
              },
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      controller: _control,
                      onChanged: (value) {
                        //Do something with the user input.
                        input = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        _control.clear();
                      });
                      _firebase.collection("messages").add({
                        "text": input,
                        "email": currentUser.email,
                        "time": FieldValue.serverTimestamp()
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BubbleShape extends StatelessWidget {
  BubbleShape(this.data, this.email, this.isCurr);
  final data;
  final email;
  final isCurr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment:
            isCurr ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            email,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          Material(
            borderRadius: BorderRadius.only(
                topRight: isCurr ? Radius.circular(30) : Radius.zero,
                topLeft: isCurr ? Radius.zero : Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            color:
                isCurr ? Colors.white.withOpacity(.8) : Colors.lightBlueAccent,
            elevation: 12,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 9),
              child: Text(
                data,
                style: TextStyle(
                    fontSize: 15, color: isCurr ? Colors.black : Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
