import 'package:bmi_calc/calc_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'MidBox.dart';
import 'LeftBox.dart';
import 'RightBox.dart';
import 'calc_page.dart';
import 'BMI_brain.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum Gender { male, female }
int height = 180;
int weight = 50;

class _MyHomePageState extends State<MyHomePage> {
  static int colorEnab = 0xFF111328;
  static int colorDis = 0xFF1D1E33;
  int color = 0xFF1D1E33;
  int malecolor = colorDis;
  int femalecolor = colorDis;
  int fflex = 1;
  int mflex = 1;

  int age = 18;

  void colourChange(Gender i) {
    if (i == Gender.male) {
      if (malecolor == colorDis) {
        malecolor = colorEnab;
        femalecolor = colorDis;
        mflex = 2;
        fflex = 0;
      } else {
        malecolor = colorDis;
        mflex = 1;
        fflex = 1;
      }
    } else {
      if (femalecolor == colorDis) {
        femalecolor = colorEnab;
        malecolor = colorDis;
        fflex = 2;
        mflex = 0;
      } else {
        femalecolor = colorDis;
        fflex = 1;
        mflex = 1;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Center(
            child: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 3,
          ),
        )),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: mflex,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        colourChange(Gender.male);
                      });
                    },
                    child: LeftBox(
                      malecolor,
                      15,
                      10,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.mars,
                            size: 80,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'MALE',
                            style: buildTextStyle(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: fflex,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        colourChange(Gender.female);
                      });
                    },
                    child: RightBox(
                      femalecolor,
                      15,
                      10,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.venus,
                            size: 80,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'FEMALE',
                            style: buildTextStyle(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MidBox(
                    color,
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text("HEIGHT", style: buildTextStyle()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(
                              width: 0,
                            ),
                            Text(
                              "cm",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff8d8e98),
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderThemeData(
                              inactiveTrackColor: Colors.white,
                              activeTrackColor: Color(0xFF8D8e98),
                              overlayShape: RoundSliderOverlayShape(
                                overlayRadius: 30,
                              ),
                              overlayColor: Color(0x98eb11555),
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 15,
                              ),
                              thumbColor: Color(0xFFeb11555)),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120,
                            max: 230,
                            onChanged: (double val) {
                              setState(() {
                                height = val.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: LeftBox(
                    color,
                    10,
                    15,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WEIGHT",
                          style: buildTextStyle(),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RawMaterialButton(
                              child: Icon(
                                FontAwesomeIcons.plus,
                                size: 20,
                              ),
                              fillColor: Color(0xff4c4f5e),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              onLongPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              shape: CircleBorder(),
                              constraints: BoxConstraints.tightFor(
                                width: 40.0,
                                height: 40.0,
                              ),
                            ),
                            SizedBox(width: 5),
                            RawMaterialButton(
                              child: Icon(
                                FontAwesomeIcons.minus,
                                size: 20,
                              ),
                              fillColor: Color(0xff4c4f5e),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              onLongPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              shape: CircleBorder(),
                              constraints: BoxConstraints.tightFor(
                                width: 40.0,
                                height: 40.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: RightBox(
                      color,
                      10,
                      15,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "AGE",
                            style: buildTextStyle(),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RawMaterialButton(
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  size: 20,
                                ),
                                fillColor: Color(0xff4c4f5e),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                onLongPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                shape: CircleBorder(),
                                constraints: BoxConstraints.tightFor(
                                  width: 40.0,
                                  height: 40.0,
                                ),
                              ),
                              SizedBox(width: 5),
                              RawMaterialButton(
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  size: 20,
                                ),
                                fillColor: Color(0xff4c4f5e),
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                onLongPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                shape: CircleBorder(),
                                constraints: BoxConstraints.tightFor(
                                  width: 40.0,
                                  height: 40.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 0,
            child: GestureDetector(
              onTap: () {
                BMIbrain obj = BMIbrain(height, weight);
                setState(() {
                  bmi = obj.getBMI();
                  resultStr = obj.getResult();
                  colors = obj.font();
                  lspace = obj.lspacer();
                  fweight = obj.fontWeighter();
                  message = obj.messages();
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Calculate();
                }));
              },
              child: Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                color: Color(0xFFeb11555),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "CALCULATE",
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

  TextStyle buildTextStyle() {
    return TextStyle(
      fontSize: 18,
      color: Color(0xff8d8e98),
    );
  }
}
