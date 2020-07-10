import 'package:flutter/material.dart';
import 'login_screen.dart';
import "registration_screen.dart";
import 'package:animated_text_kit/animated_text_kit.dart';
import "package:flash_chat/Components/RoundButton.dart";

class WelcomeScreen extends StatefulWidget {
  static String id = "/welcome";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animate;
  Animation animation;
  @override
  void initState() {
    super.initState();
    animate = AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation =
        ColorTween(begin: Colors.grey, end: Colors.white).animate(animate);
    animate.forward();
    animation.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  totalRepeatCount: 1,
                  speed: Duration(milliseconds: 500),
                  text: ["Flash Chat"],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundButton(
              Colors.lightBlueAccent,
              "Log in",
              () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundButton(
              Colors.blueAccent,
              "Register",
              () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}

