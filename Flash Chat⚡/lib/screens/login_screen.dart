import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/Components/RoundButton.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static String id = "/login";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _control = TextEditingController();
  final _control1 = TextEditingController();

  String hint = "Enter your email";
  String password;
  String email;
  bool loading = false;

  final _auth = FirebaseAuth.instance;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        color: Colors.deepOrange,
        inAsyncCall: loading,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: "logo",
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                controller: _control,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  email = value;
                  //Do something with the user input.
                },
                decoration: kTextFieldDecoration(hint),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                controller: _control1,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  password = value;
                  //Do something with the user input.
                },
                decoration: kTextFieldDecoration("Enter your password"),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundButton(
                Colors.lightBlueAccent,
                "Log In",
                () async {
                  setState(() {
                    loading = true;
                  });
                  try {
                    var user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    Navigator.pushNamed(context, ChatScreen.id);
                  } catch (e) {
                    setState(() {
                      _control.clear();
                      _control1.clear();
                      hint = "Enter valid email and password";
                    });
                  }
                  setState(() {
                    loading = false;
                  });
                  //Implement login functionality.
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
