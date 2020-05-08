
import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {

  @override
  _CalculateState createState() => _CalculateState();
}
  //final BMIbrain obj =BMIbrain(height,weight);
  String resultStr = "adgsf";
  Color colors = Colors.white;
  String bmi ;
  double lspace = 2;
  FontWeight fweight = FontWeight.w500;
  String message = "Your BMI is very less you should eat more";


class _CalculateState extends State<Calculate> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
          child: Text(
            "BMI Calculator",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              letterSpacing: 3,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Your Result",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 40,
                letterSpacing: 3,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                      child: Text(
                        resultStr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          color: colors,
                        ),
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: SizedBox(
                  //     height: 0,
                  //   ),
                  // ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                      child: Text(
                        bmi,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 70,
                          letterSpacing: lspace,
                          fontWeight: fweight,
                        ),
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: SizedBox(
                  //     height: 150,
                  //   ),
                  // ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                      child: Text(
                        message,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          textBaseline: TextBaseline.alphabetic,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  
                ],
                
              ),
            ),
          ),
          Expanded(
                    flex: 0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        color: Color(0xFFeb11555),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "RE-CALCULATE",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                letterSpacing: 2,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
        ],
      ),
    );
  }
}
