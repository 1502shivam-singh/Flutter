import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/Components/RoundButton.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = "/registration";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _control = TextEditingController();
  final _control1 = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  String hint = "Enter your email";
  bool loading = false;

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
                textAlign: TextAlign.center,
                controller: _control,
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
                Colors.blueAccent,
                "Register",
                () async {
                  // print(email);
                  // print(password);
                  setState(() {
                    loading = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);

                    if (newUser != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    } else {}
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
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
